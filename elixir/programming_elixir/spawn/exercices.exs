defmodule Exercices do
  import :timer, only: [sleep: 1]

  def sad_function(pid) do
    IO.inspect(pid, label: "pid")
    send(pid, {:hello, "world"})
    exit(:boom)
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_monitor(__MODULE__, :sad_function, [self()])

    sleep(1000)

    receive do
      msg ->
        IO.puts("MESSAGE RECEIVED: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("Nothing happened as far as I am concerned")
    end
  end
end

Exercices.run()
