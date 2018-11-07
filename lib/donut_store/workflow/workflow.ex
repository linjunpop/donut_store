defmodule DonutStore.Workflow do
  use Supervisor

  alias DonutStore.Workflow.Making
  alias DonutStore.Workflow.Baking
  alias DonutStore.Workflow.Packing

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl Supervisor
  def init(_arg) do
    children = [
      {Making, []},
      {Baking, []},
      {Packing, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
