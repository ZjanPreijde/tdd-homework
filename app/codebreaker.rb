class Codebreaker
  class Game
    attr_reader :output

    def initialize(output)
      @output = output
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
      check_input
    end

    def correct_format?
      @input.to_i.between?(1111, 9999)
    end

    def check_input
      @result = ""
      check_for_exact
      clean_up_before_number
      check_for_number
      return @result
    end

    def check_for_exact
      (0..3).each do | n |
        @result += @input[n] if @secret_number[n] == @input[n]
      end
    end

    def clean_up_before_number
      (0..@result.length - 1).each do | n |
        @input.gsub!(@result[n], " ")
      end
      @result = "+" * @result.length
    end

    def check_for_number
      (0..3).each do |n|
        if @secret_number.include?(@input[n])
          @input.gsub!(@input[n], " ")
          @result += "-"
        end
      end
    end

  end
end
