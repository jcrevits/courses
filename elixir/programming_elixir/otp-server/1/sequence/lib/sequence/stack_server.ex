defmodule Sequence.StackServer do
  use GenServer

  def start_link(stack) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end

  def pop(), do: GenServer.call(__MODULE__, :pop)

  def push(element), do: GenServer.cast(__MODULE__, {:push, element})

  def init(stack) do
    {:ok, stack}
  end

  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, element}, state) do
    {:noreply, [element | state]}
  end
end
