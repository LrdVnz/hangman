require 'json'

words = File.read '5desk.txt'
DICTIONARY = words.split(' ').map(&:downcase)

# Unique class for everything
class Game
  def initialize
    @secret_word = pick_random_word
    @turns = 0
    @winner = false
    @coded = create_coded
    @wrong_letters = []
    puts 'You have 10 turns to guess the secret word.'
    puts 'Choose a letter every turn.'
    ask_load
  end

  def save
    puts 'Choose the name of the save file'
    save_name = gets.chomp
    json = { 'secret_word' => @secret_word,
             'turns' => @turns, 'winner' => @winner,
             'coded' => @coded, 'wrong_letters' => @wrong_letters }.to_json
    gamesave = File.open('./saves/' + save_name, 'w') { |f| f << json }
  end

  def load
    puts 'Choose what save to load :'
    save_name = gets.chomp
    save = File.read('./saves/' + save_name)
    data = JSON.parse save  
    @secret_word = data['secret_word']
    @turns = data['turns']
    @winner = data['winner']
    @coded = data['coded']
    @wrong_letters = data['wrong_letters']
  end

  def pick_random_word
    secret = DICTIONARY.sample
    secret = DICTIONARY.sample until secret.length < 12 && secret.length > 5
    secret
  end

  def ask_load
    puts 'Do you want to load a game or start a new one ? (load/new)'
    answer = gets.chomp.downcase
    if answer == 'load'
      load
      game_rounds
    elsif answer == 'new'
      game_rounds
    end
  end

  def ask_save
    puts 'Do you want to save the game ? (yes/ no or press enter)'
    answer = gets.chomp.downcase
    return nil unless answer == 'yes'
    save
    puts 'Exit the game ? (yes/no)'
    response = gets.chomp.downcase
    exit if response == 'yes'
  end

  def game_rounds
    loop do
      one_turn
      if @winner == true
        puts 'YOU WIN'
        break
      elsif @turns == 10 && @winner == false
        game_lost
        break
      end
    end
  end

  def game_lost
    puts 'YOU LOSE. The word is :'
    puts @secret_word
  end

  def ask_guess
    puts 'Put your guess.'
    @guess = gets.chomp.downcase
  end

  def one_turn
    ask_save
    ask_guess
    verify_word
    @winner = true if @coded == @secret_word
    show_word
  end

  def verify_word
    if @secret_word.include?(@guess)
      @secret_word.chars.each_with_index do |c, index|
        @coded[index] = c if @guess == c
      end
    else
      @wrong_letters << @guess
      @turns += 1
    end
  end

  def create_coded
    @coded = @secret_word.gsub(/./, '_')
  end

  def show_word
    puts @coded
    puts "ditched letters : #{@wrong_letters}"
    puts "You have #{10 - @turns} guesses left"
  end
end

Game.new
