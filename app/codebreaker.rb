class Codebreaker
  class Game
    attr_reader :output

    def initialize(output)
      @output = output
#      @input  = ""
    end

    def start(secret_number)
      @secret_number = secret_number

      output.puts "Welcome to Codebreaker"
      output.puts "Enter guess:"
    end

    def guess(input)
      @input = input
      output.puts return_result
    end

    def return_result
      return "Try guessing a number with four digits" if !correct_format?
      return '' if no_matches?
      check_input
    end

    def correct_format?
      @input.to_i.between?(1111, 9999)
    end

    def no_matches?
      (0..3).each do | n |
        return false if @secret_number.include?(@input[n])
      end
      return true  # Is this necessary?
    end

    def check_input
      @result = ""

      # def check_for_exact
      (0..3).each do | n |
        if @secret_number[n] == @input[n]
          @result += @input[n]
        end
      end

      # def clean_up before_number
      (0..@result.length - 1).each do | n |
        @input.gsub!(@result[n], " ")
      end
      @result = "+" * @result.length

      # def check_for_number
      (0..3).each do |n|
        if @secret_number.include?(@input[n])
          @input.gsub!(@input[n], " ")
          @result += "-"
        end
      end
      return @result
    end

  end
end
