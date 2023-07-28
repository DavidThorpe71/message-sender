import Config

config :message_sender, MessageSender.Scheduler,
  jobs: [
    {
      "* * * *",
      fn ->
        MessageSender.FileReader.get_string_to_send(
          Path.join(
            "#{:code.priv_dir(:message_sender)}", "messages.txt"
          )
        )
        |> MessageSender.Server.send()
      end
    }
  ]