require "./kemal_controller/*"
require "kemal"

module KemalController
  get "/" do
    "Hello World!"
  end
end

Kemal.run
