require 'pry'

words = File.read '5desk.txt'
DICTIONARY = words.split(' ').map{ |w| w.downcase }

class Game
  def initialize
    @secret_word = pick_random_word
    @turns = 0
    @winner = false 
    @coded = create_coded
    @wrong_letters = []
    puts "You have 10 turns to guess the secret word."
    puts "Choose a letter every turn."
    gameRounds
  end

  def pick_random_word
    secret = DICTIONARY.sample
    secret = DICTIONARY.sample until secret.length < 12 && secret.length > 5  
    return secret
  end
  
  def gameRounds
    loop do
     oneTurn
      if @winner == true
        puts "YOU WIN"
        break
      elsif @turns == 10 && @winner == false
        puts "YOU LOSE"
        break
      end
    end
  end

  def ask_guess
   @guess = gets.chomp.downcase
  end

  def oneTurn
     ask_guess
     verify_word
     if @coded == @secret_word
          @winner = true
     end
     showWord
  end

  def verify_word
     if @secret_word.include?(@guess)
        # loop through each secret_word letter. If it is equal to guess, put it on coded at the same index.
        @secret_word.chars.each_with_index { |c, index| @coded[index] = c if @guess == c }
     else 
        @wrong_letters << @guess
        @turns += 1
     end
  end

  def create_coded 
     @coded = @secret_word.chars.map{ |c| c = '_'}.join('')
  end

  def showWord 
     puts @coded 
     puts "ditched letters : #{@wrong_letters}"
     puts "You have #{10 - @turns} guesses left"
  end
end

binding.pry