defmodule DonutStore.Staff.Clair do
  alias DonutStore.Donut
  alias DonutStore.Package

  require Logger

  def pack_donut(%Donut{} = donut) do
    ms_to_sleep =
      3000..8000
      |> Enum.random()

    Logger.warn("I'm sleepy, let me take a rest for #{ms_to_sleep}ms")

    :timer.sleep(ms_to_sleep)

    package = %Package{donut: donut}

    Logger.info("Packed donut: #{inspect(package)}")
  end
end
