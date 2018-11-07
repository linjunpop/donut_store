defmodule DonutStoreTest do
  use ExUnit.Case
  doctest DonutStore

  test "greets the world" do
    assert DonutStore.hello() == :world
  end
end
