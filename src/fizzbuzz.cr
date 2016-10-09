require "./fizzbuzz/*"

module Fizzbuzz
  def self.div_by_three(n)
    n % 3 == 0
  end

  def self.div_by_five(n)
    n % 5 == 0
  end

  def self.div_by_fifteen(n)
    div_by_three(n) && div_by_five(n)
  end

  def self.fizzbuzz
    (1..100).each do |n|
      res = ""
      if Fizzbuzz.div_by_three(n)
        if Fizzbuzz.div_by_five(n)
          res = "FizzBuzz"
        else
          res = "Fizz"
        end
      elsif Fizzbuzz.div_by_five(n)
        res = "Buzz"
      else
        res = n.to_s
      end
      puts res
    end
  end
end

# This is a rogue method outside of any module!
def fizzbuzz
  (1..100).each do |n|
    res = ""
    res += "Fizz" if n % 3 == 0
    res += "Buzz" if n % 5 == 0
    res += n.to_s if res == ""
    puts res
  end
end
