defmodule DonutStore.Workflow.Baking do
  use GenStage
  require Logger

  alias DonutStore.Staff.Bob
  alias DonutStore.Workflow.Making

  def start_link(args) do
    GenStage.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(_) do
    {:producer_consumer, :state, subscribe_to: [{Making, min_demand: 3, max_demand: 5}]}
  end

  def handle_events(events, _from, state) do
    events =
      events
      |> Enum.map(&Bob.bake_donut(&1, :yellow))

    {:noreply, events, state}
  end
end
