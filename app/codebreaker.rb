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
      return "Try guessing a number with four digits" if !correct_format?
      @result = ""
      check_input
    end

    def correct_format?
      correct_length? && is_all_digits?
    end

    def correct_length?
      @input.length == REQUIRED_INPUT_LENGTH
    end

    def is_all_digits?
      !@input[/\d{#{REQUIRED_INPUT_LENGTH}}/].nil?
    end

    def check_input
      check_for_exacts
      check_for_numbers
      return @result
    end

    def check_for_exacts
      (0..REQUIRED_INPUT_LENGTH - 1).each do | input_pos |
        check_exact(input_pos)
      end
    end

    def check_exact(input_pos)
      secret_pos = input_pos
      return if @secret_number[secret_pos] != @input[input_pos]
      process_result(input_pos, secret_pos, "+")
    end

    def check_for_numbers
      (0..REQUIRED_INPUT_LENGTH - 1).each do |input_pos|
        check_number(input_pos) if @input[input_pos] != " "
      end
    end

    def check_number(input_pos)
      secret_pos = @secret_number.index(@input[input_pos])
      return if secret_pos.nil?
      process_result(input_pos, secret_pos, "-")
    end

    def process_result(input_pos, secret_pos, result)
      @input[input_pos]          = " "
      @secret_number[secret_pos] = " "
      @result                   += result
    end

  end
end
