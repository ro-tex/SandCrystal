require "./SandCrystal/*"
require "kemal"

module SandCrystal
  get "/" do
    "Hello World!"
  end
end

#Kemal.run