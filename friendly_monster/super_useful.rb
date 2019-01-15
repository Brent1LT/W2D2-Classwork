# PHASE 2
def convert_to_int(str)
  begin 
    Integer(str)
  rescue StandardError 
    nil 
  end 
end

# PHASE 3
class CoffeeError < StandardError; end 

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin 
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError
    retry 
  end 
    
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime


    begin 

    rescue IDontKnowYouError 
      puts "Foo! You don't know me like that!" 
      exit 
    rescue BoringFriendError
      puts "Man you don't do nothin'!"
    rescue UGotNoNameError
      puts "Hey, you didn't tell me your name, some Best Friend..."
    end 
  end

  def friend_check
    @yrs_known < 5
  end 

  def talk_about_friendship
    raise IDontKnowYouError if @yrs_known < 5
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    raise BoringFriendError if @fav_pastime.length <= 0 
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"

  end

  def give_friendship_bracelet
    raise UGotNoNameError if @name.length <= 0  
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 

  end

end

class UGotNoNameError < StandardError; end 

class IDontKnowYouError < StandardError; end 

class BoringFriendError < StandardError; end 

