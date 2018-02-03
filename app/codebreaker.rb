class Codebreaker
  class Game
    attr_reader :output

    def initialize(output)
      @output = output
      @input  = ""
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
      "You typed something"
    end

    def correct_format?
      @input.to_i.between?(1111, 9999)
    end

  end
end
