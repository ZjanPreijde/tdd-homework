# ERRATUM

###codebreaker_spec.rb

 section [D], test 3 :  there's no exact match

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

Section [G], test 3: description is wrong

​      `it "a number match at the end overrules a number match" do`

should be 

​      `it "an exact match at the end overrules a number match" do`





## README.md

I found out that after you fork and clone your forked repository, then push commits to your forked repository, when merging, the default merge target is the original repository, not the forked repository.

Maybe check if this is correct, and, if so, mention this in the README.md.



"If you implementat of the `#guess` method in alphabetical order of these context, ..."

"to solve ther logical error, "

"Regading code coverage:"

Consistency : some list items start with capital, others don't.