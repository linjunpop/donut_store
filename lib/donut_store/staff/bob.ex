defmodule DonutStore.Staff.Bob do
  alias DonutStore.Donut
  require Logger

  @type color_t :: :yellow | :red

  @spec bake_donut(DonutStore.Donut.t(), color_t()) :: DonutStore.Donut.t()
  def bake_donut(%Donut{} = donut, color) do
    Logger.info("Baking donut: #{inspect(donut)}")

    %{donut | color: color}
  end
end
