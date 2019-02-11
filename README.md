# SelfDiscovering

Small project to show how it is possible to do service discovery (a very simple) with Elixir.

Each "service" wil register itself by creating a file in __/tmp/sync_dir/__.
Then each service will loop through all service then ping it and log either the services are up or no.

## Run

To run the project open __two_ terminals : 
 - Run ```./run_a1.sh``` in the first.
 - Execute ```SelfDiscovering.loop()```.
 - Run ```./run_a2.sh``` in the second.
 - Execute ```SelfDiscovering.loop()```.

You should see this :
```
15:20:42.854 [info]  a1@kata[a3@kata: false, a2@kata: true, a1@kata: true]

15:20:43.856 [info]  a1@kata[a3@kata: false, a2@kata: true, a1@kata: true]
```

## Credits

All the credits of the solution goes to GuyY [https://www.spectory.com/blog/](https://www.spectory.com/blog/Elixir%20Self%20Discovering%20Cluster)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `self_discovering` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:self_discovering, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/self_discovering](https://hexdocs.pm/self_discovering).

