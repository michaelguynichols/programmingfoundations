# rock_paper_scissors.rb

VALID_CHOICES = %w(rock paper scissors)
WINNING_PAIRS = [%w(rock scissors), %w(paper rock), %w(scissors paper)]

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer)
  check = [player, computer]
  if WINNING_PAIRS.include?(check)
    prompt("You won!")
  elsif player == computer
    prompt("You tied.")
  else
    prompt("Computer won.")
  end
end

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

  Kernel.puts("You chose #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
