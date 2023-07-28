defmodule MessageSender.Server do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: :message_server)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast({:message, message}, _) do
    MessageSender.Send.send(message)
    {:noreply, %{}}
  end

  def send(message) do
    GenServer.cast(:message_server, {:message, message})
  end
end
