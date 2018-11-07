defmodule DonutStore.Workflow.Packing do
  use GenStage

  alias DonutStore.Workflow.Baking
  alias DonutStore.Staff.Clair

  def start_link(args) do
    GenStage.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(_) do
    {:consumer, :state, subscribe_to: [{Baking, min_demand: 1, max_demand: 2}]}
  end

  def handle_events(events, _from, state) do
    events
    |> Enum.map(&Clair.pack_donut/1)

    {:noreply, [], state}
  end
end
