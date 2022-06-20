class GuessingGame


    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end


    def check_num(num)
        # while num != @secret_num
            @num_attempts += 1
            if num == @secret_num
                print "you win"
                @game_over = true
            elsif num > @secret_num
                print "too big"
            elsif num < @secret_num
                print "too small"
            end
        # end

    
    end

    def ask_user
        print "enter a number"
        num = gets
        num = num.chomp.to_i
        check_num(num)
    end
   
end

