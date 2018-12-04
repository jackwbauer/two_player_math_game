class Game
    attr_reader :current_player

    @current_question

    def initialize(players)
        @player1 = players[0]
        @player2 = players[1]
        @current_player = @player1
        @game_over = false
        self.game_cycle
    end

    def game_cycle
        while @game_over == false
            new_question
            player_answer = ask_question
            check_answer(player_answer, @current_question.solution)
            break if @game_over
            display_score
            swap_turns
        end
        game_over
    end

    def new_question
        @current_question = Question.new
    end

    def ask_question
        puts "#{@current_player.name}: #{@current_question}"
        answer = gets.chomp.to_i
    end

    def check_answer(player_answer, solution)
        if player_answer == solution
            puts 'Correct!'
        else
            puts 'Wrong!'
            @current_player.lose_life
        end
        @game_over = true if @current_player.lives == 0
    end

    def display_score
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        puts '----- NEW TURN -----'
    end

    def swap_turns
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def game_over
        swap_turns
        puts "#{@current_player.name} wins with a score of #{@current_player.lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
    end
end