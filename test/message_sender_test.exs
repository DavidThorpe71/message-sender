defmodule MessageSenderTest do
  use ExUnit.Case
  alias MessageSender.Send

  test "greets the world" do
    assert Send.send("bread") == :world
  end
end
