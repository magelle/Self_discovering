defmodule SelfDiscovering do
  require Logger

  @sync_dir "/tmp/sync_dir/"
  @interval 1000

  def loop do
    sign_as_active_node()
    status = inspect(check_active_nodes())
    Logger.info(Atom.to_string(Node.self()) <> status)
    :timer.sleep(@interval)
    loop()
  end

  @doc """
  List all the registered nodes and pign them to be sure it is alive.
  """
  def check_active_nodes do
    active_nodes()
    |> Enum.map(&String.to_atom(&1))
    |> Enum.map(&{&1, Node.ping(&1) == :pong})
  end

  def active_nodes do
    {:ok, active_members} = File.ls(@sync_dir)
    active_members
  end

  @doc """
  Register the active node in the service registry (whiich is actually a folder).
  Then write the current timestamp in it.
  This timestamp will allow us to know when the node was alive.
  """
  def sign_as_active_node do
    File.mkdir_p(@sync_dir)
    {:ok, file} = File.open(path(), [:write])
    IO.binwrite(file, time_now_as_string())
    File.close(file)
  end

  @doc """
  get the path of the local node file
  """
  def path do
    @sync_dir <> Atom.to_string(Node.self())
  end

  def time_now_as_string do
    {date, time} = :calendar.local_time()

    str_date =
      date
      |> Tuple.to_list()
      |> Enum.map(&Integer.to_string/1)
      |> Enum.join("/")

    str_time =
      time
      |> Tuple.to_list()
      |> Enum.map(&Integer.to_string/1)
      |> Enum.join("/")

    str_time <> " - " <> str_date
  end
end
