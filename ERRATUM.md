# ERRATUM

###codebreaker_spec.rb

 section [D] :  there's no exact match

- If the code is correct, this test will never pass.
- If the test passes, there's something wrong with the code :-)

```ruby
      it "1 exact match and 1 number match (in that order) sends a mark with '+-'" do
        game.start('1234')
        input = '4151'
        expect(output).to receive(:puts).with('+-')

        game.guess(input)
      end
```

Replacing `'1234'` with `secret_number` fixed it.



###codebreaker.rb, codebreaker_spec.rb

"Try guessing a number with four digits"

0 is a digit

->  "Try guessing a number with four digits (1-9)"





## README.md

"If you implementat of the `#guess` method in alphabetical order of these context, ..."

"to solve ther logical error, "

"Regading code coverage:"

Consistency : some list items start with capital, others don't.