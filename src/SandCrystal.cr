require "./SandCrystal/*"

module SandCrystal
  MESSAGE = "Hello!"

  class Sand
    def hi(*msg)
      say MESSAGE
    end

    # Notice the paretheses and the spaces around the column - those re required
    def hi(msg : String)
      say msg
    end

    def hi(msg : Number)
      say ">>> #{msg.to_s} <<<"
    end

    private def say(msg)
      puts msg
      msg
    end
  end

  Sand.new.hi
end
