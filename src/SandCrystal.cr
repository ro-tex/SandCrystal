require "./SandCrystal/*"

module SandCrystal
  MESSAGE = "Hello!"

  class Sand
    def hi
      say MESSAGE
    end

    def hi(msg)
      hi
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

  s = Sand.new
  s.hi("from the module")
end

# This is how we need to instantiate outside the module:
s_out = SandCrystal::Sand.new
