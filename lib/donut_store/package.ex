defmodule DonutStore.Package do
  alias DonutStore.Donut

  defstruct([:donut])

  @type t :: %__MODULE__{
          donut: Donut.t()
        }

  def build(donut) do
    %__MODULE__{
      donut: donut
    }
  end
end
