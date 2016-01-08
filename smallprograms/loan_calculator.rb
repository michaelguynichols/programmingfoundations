# loancalculator.rb

# The following formula is used to calculate the fixed monthly payment
# (P) required to fully amortize a loan of L dollars over a term of n
# months at a monthly interest rate of c. [If the quoted rate is 6%,
# for example, c is .06/12 or .005].

# P = L[c(1 + c)n]/[(1 + c)n - 1]

require 'yaml'

MESSAGES = YAML.load_file('loan_messages.yml')

def prompt(message)
  puts ">>> #{message}"
end

def valid_number?(num)
  Float(num) || Integer(num) rescue false
end

def convert_to_months(years)
  Integer(years) * 12
end

def convert_to_rate(whole_number_rate)
  converted = Float(whole_number_rate) / 100.0
  converted
end

def convert_to_monthly_rate(rate)
  converted = Float(rate) / 12.0
  converted
end

def calculate_loan_payment(dollars, rate, months)
  months = Float(months)
  one_plus_rate = 1.0 + rate
  numerator = rate * (one_plus_rate**months)
  denominator = one_plus_rate**months - 1.0
  result = numerator / denominator
  final_result = dollars.to_f * result
  Float(final_result).round(2)
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp
  if name == ''
    prompt(MESSAGES['invalid_name'])
  else
    break
  end
end

prompt("Hi, #{name}!")

loop do # main loop
  prompt(MESSAGES['loan_amount'])

  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      break
    else
      prompt(MESSAGES['invalid_loan_amount'])
    end
  end

  prompt("Your loan amount is $#{loan_amount}.")

  prompt(MESSAGES['loan_years'])

  loan_years = ''
  loop do
    loan_years = gets.chomp
    if valid_number?(loan_years)
      break
    else
      prompt(MESSAGES['invalid_years'])
    end
  end

  prompt("Your loan duration is #{loan_years} years.")

  loan_months = convert_to_months(loan_years)

  prompt("Your loan will last #{loan_months} months.")

  prompt(MESSAGES['interest_rate'])

  apr = ''

  loop do
    apr = gets.chomp
    if valid_number?(apr)
      break
    else
      prompt(MESSAGES['invalid_interest'])
    end
  end

  prompt("Your annual percentage rate is #{apr}%.")

  converted_apr = convert_to_rate(apr)
  monthly_apr = convert_to_monthly_rate(converted_apr)
  monthly_formatted_apr = monthly_apr * 100.0

  prompt("Your monthly percentage rate is #{monthly_formatted_apr.round(2)}%.")

  loan_payment = calculate_loan_payment(loan_amount, monthly_apr, loan_months)

  prompt("Your monthly loan payment is $#{format('%02.2f', loan_payment)}.")

  prompt(MESSAGES['another_calculation'])

  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['thank_you'])
