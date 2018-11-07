defmodule DonutStore.Donut do
  defstruct([:id, :color])

  @type t :: %__MODULE__{
          id: binary,
          color: :white | :blue | :green
        }

  @spec build() :: t()
  def build() do
    %__MODULE__{
      id: Nanoid.generate(),
      color: :white
    }
  end
end
