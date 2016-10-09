require "./SandCrystal/*"

module SandCrystal
  class Sand
    def hi
      say "Hello!"
    end

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

  sa = Sand.new
  sa.hi("from the module")
end

s = SandCrystal::Sand.new
s.hi
