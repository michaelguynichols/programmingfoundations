# rock_paper_scissors.rb

VALID_CHOICES = %w(r p s l S)
WINNING_PAIRS = [%w(r s), %w(p r), %w(s p), %w(r l), %w(l S),
  %w(s l), %w(l p), %w(p S), %w(S r)]
CHOICES_INTO_WORDS = {"r" => "rock", "p" => "paper", "s" => "scissors", "l" => "lizard", "S" => "Spock"}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer)
  check_win = [player, computer]
  if WINNING_PAIRS.include?(check_win)
    prompt("You won!")
  elsif player == computer
    prompt("You tied.")
  else
    prompt("Computer won.")
  end
end

def display_score(player, computer)
  prompt("Player: #{player}; Computer: #{computer}")
end

def individual_match_win?(player, computer)
  check_win = [player, computer]
  if WINNING_PAIRS.include?(check_win)
    return "Player"
  elsif player == computer
    return "Tie"
  else
    return "Computer"
  end
end

def match_win?(player, computer)
  player == 5 || computer == 5
end

def who_won?(player, computer)
  if player == 5
    prompt("You have won the match!")
  else
    prompt("The computer has won the match!")
  end
end

def convert_to_words(letter)
  converted = CHOICES_INTO_WORDS[letter]
  converted
end

# Scores
player_score = 0
computer_score = 0

loop do

  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose #{convert_to_words(choice)}; Computer chose: #{convert_to_words(computer_choice)}")

  display_results(choice, computer_choice)

  winner = individual_match_win?(choice, computer_choice)
  if winner == "Player"
    player_score += 1
  elsif winner == "Computer"
    computer_score += 1
  end
  display_score(player_score, computer_score)

  if !match_win?(player_score, computer_score)
    prompt("Do you want to play again?")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
  else
    who_won?(player_score, computer_score)
    prompt("Final score: Player: #{player_score}; Computer #{computer_score}")
    break
  end
end

prompt("Thank you for playing. Good bye!")
