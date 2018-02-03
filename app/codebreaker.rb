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
      return '+' if has_one_on_position?
      return '-' if has_one_anywhere?
      get_result
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

    def no_matches?
      (0..3).each do | n |
        return false if @secret_number.include?(@input[n])
      end
      return true  # Is this necessary?
    end

    def has_one_anywhere?
      (0..3).each do | n |
        return true if @secret_number.include?(@input[n])
      end
      return false
    end

    def has_one_on_position?
      (0..3).each do | n |
        return true if @secret_number[n] == @input[n]
      end
      return false
    end

    def get_result
      'TODO'
    end

  end
end
