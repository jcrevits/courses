defmodule Servy.PledgeServer do
  @name :pledge_server

  use GenServer

  defmodule State do
    defstruct cache_size: 3, pledges: []
  end

  def start do
    IO.puts("Starting pledge server...")
    GenServer.start(__MODULE__, %State{}, name: @name)
  end

  def create_pledge(name, amount) do
    GenServer.call(@name, {:create_pledge, name, amount})
  end

  def recent_pledges do
    GenServer.call(@name, :recent_pledges)
  end

  def total_pledged do
    GenServer.call(@name, :total_pledged)
  end

  def set_cache_size(size) when is_integer(size) do
    GenServer.cast(@name, {:set_cache_size, size})
  end

  def clear() do
    GenServer.cast(@name, :clear)
  end

  # Server Callbacks

  @impl true
  def init(state) do
    pledges = fetch_recent_pledges_from_service()
    {:ok, %{state | pledges: pledges}}
  end

  @impl true
  def handle_cast({:set_cache_size, size}, state) do
    {:noreply, %{state | cache_size: size}}
  end

  @impl true
  def handle_cast(:clear, state) do
    {:noreply, %{state | pledges: []}}
  end

  @impl true
  def handle_cast(:set_cache_size, state) do
    {:noreply, %{state | pledges: []}}
  end

  @impl true
  def handle_call(:total_pledged, _from, state) do
    total = Enum.map(state.pledges, &elem(&1, 1)) |> Enum.sum()

    {:reply, total, state}
  end

  def handle_call(:recent_pledges, _from, state) do
    {:reply, state.pledges, state}
  end

  def handle_call({:create_pledge, name, amount}, _from, state) do
    {:ok, id} = send_pledge_to_service(name, amount)
    IO.inspect(state.cache_size, label: "state.cache_size")
    most_recent_pledges = Enum.take(state.pledges, state.cache_size - 1)
    cached_pledges = [{name, amount} | most_recent_pledges]
    new_state = %{state | pledges: cached_pledges}

    {:reply, id, new_state}
  end

  @impl true
  def handle_info(message, state) do
    IO.puts("Can't touch this - #{inspect(message)}")

    {:noreply, state}
  end

  defp send_pledge_to_service(_name, _amount) do
    {:ok, "pledge-#{:rand.uniform(1_000)}"}
  end

  defp fetch_recent_pledges_from_service() do
    # just a super basic API mock

    [{"wilma", 15}, {"fred", 25}]
  end
end

alias Servy.PledgeServer

{:ok, pid} = PledgeServer.start()

send(pid, {:stop, "hammertime"})

PledgeServer.set_cache_size(4)

IO.inspect(PledgeServer.create_pledge("larry", 10))

# PledgeServer.clear()

# IO.inspect(PledgeServer.create_pledge("moe", 20))
# IO.inspect(PledgeServer.create_pledge("curly", 30))
# IO.inspect(PledgeServer.create_pledge("daisy", 40))
# IO.inspect(PledgeServer.create_pledge("grace", 40))

IO.inspect(PledgeServer.recent_pledges())

IO.inspect(PledgeServer.total_pledged())
