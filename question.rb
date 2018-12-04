class Question
    attr_reader :solution
    def initialize()
        get_numbers
        # @operator = self.random_operator
        # @solution = self.calculate_solution
        @solution = @num1 + @num2
    end

    # def get_numbers
    #     puts 'Please enter 2 numbers between 1 and 20'
    #     @num1 = gets.chomp.to_i
    #     @num2 = gets.chomp.to_i
    # end

    def get_numbers
        @num1 = rand(1..20)
        @num2 = rand(1..20)
    end

    # def random_operator
    #     ['+', '-', '*'].sample
    # end

    # def calculate_solution
    #      case @operator
    #      when '+'
    #         @num1 + @num2
    #      when '-'
    #         @num1 - @num2
    #      when '*'
    #         @num1 * @num2
    #      end
    # end

    def to_s
        "What does #{@num1} plus #{@num2} equal?"
    end
end