defmodule DonutStore.Staff.Alice do
  alias DonutStore.Donut
  require Logger

  @spec make_donuts(integer()) :: [Donut.t()]
  def make_donuts(n) do
    Logger.info("I'm making #{n} donuts")

    Stream.repeatedly(&Donut.build/0)
    |> Enum.take(n)
  end
end
