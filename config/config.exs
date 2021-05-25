use Mix.Config

config :aoc, Aoc.GetInput,
  # allow_network?: true,
  session_cookie: System.get_env("ADVENT_OF_CODE_SESSION_COOKIE"),
  cache_dir: "assets/inputs"
# If you don't like environment variables, put your cookie in
# a `config/secrets.exs` file like this:
#
# config :aoc, Aoc.GetInput,
#   advent_of_code_session_cookie: "session=..."

try do
  import_config "secrets.exs"
rescue
  _ -> :ok
end