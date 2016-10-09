require "./SandCrystal/*"

module SandCrystal
  def self.hi
    puts "Hello!"
  end

  def self.hi(msg : String)
    puts msg
  end

  def self.hi(msg : Number)
    puts ">>> #{msg.to_s} <<<"
  end
end

