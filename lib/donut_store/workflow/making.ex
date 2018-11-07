defmodule DonutStore.Workflow.Making do
  use GenStage
  require Logger

  alias DonutStore.Staff.Alice

  def start_link(args) do
    GenStage.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl GenStage
  def init(_state) do
    {:producer, %{events: []}}
  end

  @impl GenStage
  def handle_demand(0, state) do
    {:noreply, [], state}
  end

  def handle_demand(demand, state) when is_integer(demand) and demand > 0 do
    events = Alice.make_donuts(demand)

    {:noreply, events, state}
  end
end
