class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  
  def self.random_word
  
    DICTIONARY.sample
  
  end

  def initialize

    @secret_word = Hangman.random_word
    # @guess_word = []
    # (@secret_word.length).times {@guess_word << '_'}
    @guess_word = Array.new(@secret_word.length) {'_'}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5

  end

  def already_attempted?(char)

    @attempted_chars.include?(char)

  end

  def get_matching_indices(char)
  
    final = []
    @secret_word.each_char.with_index {|x, i| final << i if char.include?(x) }
    final
  
  end

  def fill_indices(char, arr)
  
    arr.each { |x| @guess_word[x] = char }
  
  end

  def try_guess(char)
  
    get_matching_indices(char)
    fill_indices(char, get_matching_indices(char))
      if already_attempted?(char)
        print 'that has already been attempted'
        return false
      else
        attempted_chars.push(char)
        if !@secret_word.match?(/[#{char}]/)
          @remaining_incorrect_guesses -= 1
        end
        return true
      end
  end

  def ask_user_for_guess
  
  print 'Enter a char:'
  x = gets.chomp
  try_guess(x)

  end

  def win?
  
    if @guess_word.join("") == @secret_word
      puts
      puts
      print 'WIN'
      puts
      true
    else
      false
    end


  end

  def lose?

    if @remaining_incorrect_guesses == 0
      puts
      print 'LOSE'
      puts
      true
    else
      false
    end

  end

  def game_over?
    if win?
      puts
      print "word is #{@secret_word}"
      puts
      puts
      true
    elsif lose?
      puts
      puts
      print "word is #{@secret_word}"
      puts
      puts
      true
    else
      false
    end
  end

  def visualizer
    if @remaining_incorrect_guesses == 5
    print """ 
  
  
  
  
            =================================
                        +---+
                        |   |
                            |
                            |
                            |
                            |
                      =========
             ================================= """
    elsif @remaining_incorrect_guesses == 4
      print """ 
  
  
  
  
            =================================
                        +---+
                        |   |
                        O   |
                        |   |
                            |
                            |
                      =========
             ================================= """

    elsif @remaining_incorrect_guesses == 3
      print """ 
  
  
  
  
            =================================
           
                        +---+
                        |   |
                        O   |
                       /|   |
                            |
                            |
                      =========
             ================================= """

    elsif @remaining_incorrect_guesses == 2
      print """ 
  
  
  
  
      =================================
     
                        +---+
                        |   |
                        O   |
                       /|\  |
                            |
                            |
                      =========
       ================================= """

    elsif @remaining_incorrect_guesses == 1
      print """ 
  
  
  
  
      =================================
     
                        +---+
                        |   |
                        O   |
                       /|\  |
                       /    |
                            |
                      =========
       ================================= """

    elsif @remaining_incorrect_guesses == 0
      print """ 
  
  
  
  
      =================================
     
                        +---+
                        |   |
                        O   |
                       /|\  |
                       / \  |
                            |
                      =========
       ================================= """
    end
  end


end
