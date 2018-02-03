class Codebreaker
  REQUIRED_INPUT_LENGTH = 4
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
      return "Try guessing a number with four digits" if !correct_input?
      check_input
    end

    def correct_input?
      correct_length? && correct_format?
    end

    def correct_length?
      @input.length == REQUIRED_INPUT_LENGTH
    end

    def correct_format?
      !@input[/\d{#{REQUIRED_INPUT_LENGTH}}/].nil?
    end

    def check_input
      @result = ""
      check_for_exacts
      check_for_numbers
      return @result
    end

    def check_for_exacts
      (0..REQUIRED_INPUT_LENGTH - 1).each do | n |
        check_exact(n)
      end
    end

    def check_exact(n)
      return if @secret_number[n] != @input[n]
      @input[n]         = " "
      @secret_number[n] = " "
      @result          += "+"
    end

    def check_for_numbers
      (0..REQUIRED_INPUT_LENGTH - 1).each do |n|
        check_number(n) if @input[n] != " "
      end
    end

    def check_number(n)
      found_at = @secret_number.index(@input[n])
      return if found_at.nil?
      @secret_number[found_at] = " "
      @result                 += "-"
    end

  end
end
