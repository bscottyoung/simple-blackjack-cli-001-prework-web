def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  return rand(11) + 1
end

def display_card_total(num)
  puts "Your cards add up to #{num}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"

end

def get_user_input
  return gets.chomp
end

def end_game(num)
  puts "Blackjack" if num == 21
  puts "Sorry, you hit #{num}. Thanks for playing!" if num > 21
end

def initial_round
  card1 = deal_card
  card2 = deal_card
  sum = card1 + card2
  display_card_total(sum)
  return sum
end

def hit?(num) #num = current card total
  prompt_user
  answer = get_user_input
  if answer == "h"
    num += deal_card
    return num
  elsif  answer == "s"
    return num
  else
    invalid_command
  end
end

def invalid_command
  puts "Please enter a valid command"
  prompt_user
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  sum = initial_round #includes call to display_card_total
  x = true
  while x == true
    if sum == 21
      end_game(sum)
      x = false
    elsif sum > 21
      end_game(sum)
      x = false
    else
      sum = hit?(sum)
      display_card_total(sum)
    end
  end
end
