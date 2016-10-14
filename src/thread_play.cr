module ThreadPlay
  CHANNEL    = Channel(String).new
  END_PHRASE = "end"

  class Listener
    def listen
      counter = 0
      while true
        msg = CHANNEL.receive
        break if msg == END_PHRASE
        puts "Received: [#{counter += 1}] >>>#{msg}<<<"
      end
    end
  end

  class Sender
    def send(msg, times)
      times.times do |seq_num|
        Fiber.sleep(Random.rand(5))
        CHANNEL.send "#{msg} #{seq_num}"
      end
      CHANNEL.send END_PHRASE
    end
  end

  s1 = Sender.new
  s2 = Sender.new
  spawn { s1.send("hello", 5) }
  spawn { s2.send("oi!", 9) }
  Listener.new.listen # listening until the first END_PHRASE
  Listener.new.listen # listening from the first to the second END_PHRASE
end
