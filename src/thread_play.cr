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
      # `send` is a blocking operation, that's why this works
      # if it wasn't or if we `send` in a new fiber then we would
      # hit the END_PHRASE sending immediately (cause it has no delay)
      # and our listener woul exit before it can do what we want it to do
      times.times do |seq_num|
        Fiber.sleep(Random.rand(5))
        CHANNEL.send "#{msg} #{seq_num}"
      end
      CHANNEL.send END_PHRASE
    end
  end

  # s1 = Sender.new
  # s2 = Sender.new
  # spawn { s1.send("hello", 5) }
  # spawn { s2.send("oi!", 9) }
  # Listener.new.listen # listening until the first END_PHRASE
  # Listener.new.listen # listening from the first to the second END_PHRASE
  class CpuHoarder
    def self.call(ch, secs)
      start = Time.now
      counter = 0
      while (Time.now < start + secs.second)
        counter += 1
      end
      ch.send(nil)
    end
  end

  # ch = Channel(Nil).new
  # 10.times do
  #   spawn {
  #     CpuHoarder.call(ch, 15)
  #   }
  # end
  # ch.receive # this is the mechanism for waiting for fibers to finish.
end
