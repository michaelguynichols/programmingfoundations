require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNER = { PLAYER_MARKER => "You", COMPUTER_MARKER => "The computer" }

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  # system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end

def joinor(array, separator = ",", final_separator = "or")
  joined_array = array[0, array.length - 1]
  joined_array.insert(-1, (final_separator + " " + array[-1].to_s))
  joined_array.join(separator + " ")
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    empty_squares_to_format = empty_squares(brd)
    prompt "Choose a square (#{joinor(empty_squares_to_format, ";", "and finally")}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_defense(brd)
  winning = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
            [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
            [[1, 5, 9], [3, 5, 7]]
  winning.each do |winning_combos|
    check_markers = []
    winning_combos.each do |num|
      check_markers << brd[num]
    end
    if check_markers.count(PLAYER_MARKER) == 2 && check_markers.count(" ") == 1
      winning_combos.each do |num|
        if brd[num] == ' '
          return num.to_i
        end
      end
    end
  end
  nil
end

def computer_offense(brd)
  winning = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
            [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
            [[1, 5, 9], [3, 5, 7]]
  winning.each do |winning_combos|
    check_markers = []
    winning_combos.each do |num|
      check_markers << brd[num]
    end
    if check_markers.count(COMPUTER_MARKER) == 2 && check_markers.count(" ") == 1
      winning_combos.each do |num|
        if brd[num] == ' '
          return num.to_i
        end
      end
    end
  end
  nil
end

def computer_places_piece!(brd)
  offense = computer_offense(brd)
  defense = computer_defense(brd)
  p "Defense: #{defense}"
  if offense
    brd[offense] = COMPUTER_MARKER
  elsif defense
    brd[defense] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def place_piece!(brd, current_player)
  if current_player == PLAYER_MARKER
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  if current_player == PLAYER_MARKER
    COMPUTER_MARKER
  else
    PLAYER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def check_indices(brd, one, two, three)
  if brd[one] == ' ' || brd[two] == ' ' || brd[three] == ' '
    nil
  elsif brd[one] == brd[two] && brd[one] == brd[three]
    brd[one]
  end
end

def check_horizontals(brd)
  if check_indices(brd, 1, 2, 3)
    check_indices(brd, 1, 2, 3)
  elsif check_indices(brd, 4, 5, 6)
    check_indices(brd, 4, 5, 6)
  elsif check_indices(brd, 7, 8, 9)
    check_indices(brd, 7, 8, 9)
  end
end

def check_verticals(brd)
  if check_indices(brd, 1, 4, 7)
    check_indices(brd, 1, 4, 7)
  elsif check_indices(brd, 2, 5, 8)
    check_indices(brd, 2, 5, 8)
  elsif check_indices(brd, 3, 6, 9)
    check_indices(brd, 3, 6, 9)
  end
end

def check_diagonals(brd)
  if check_indices(brd, 1, 5, 9)
    check_indices(brd, 1, 5, 9)
  elsif check_indices(brd, 3, 5, 7)
    check_indices(brd, 3, 5, 7)
  end
end

def detect_winner(brd)
  if check_diagonals(brd)
    WINNER[check_diagonals(brd)]
  elsif check_horizontals(brd)
    WINNER[check_horizontals(brd)]
  elsif check_verticals(brd)
    WINNER[check_verticals(brd)]
  end
end

def update_score(score)
  score += 1
  score
end

def display_score(p_score, c_score)
  prompt "Player wins: #{p_score}; Computer wins: #{c_score}"
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def five_matches_won?(p_score, c_score)
  if p_score == 5
    true
  elsif c_score == 5
    true
  end
end

player_score = 0
computer_score = 0

loop do
  board = initialize_board
  current_player = PLAYER_MARKER

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    prompt "#{winner} won!"
    if winner == WINNER[PLAYER_MARKER]
      player_score = update_score(player_score)
    elsif winner == WINNER[COMPUTER_MARKER]
      computer_score = update_score(computer_score)
    end
  else
    prompt "It's a tie!"
  end

  display_score(player_score, computer_score)

  break if five_matches_won?(player_score, computer_score)

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Goodbye."
