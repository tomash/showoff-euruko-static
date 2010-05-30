!SLIDE title-slide

# ParseTree

## ruby code into s-expressions

### (lisp geeks (might(explain (more))))


!SLIDE code

## from Ruby

    @@@ Ruby
    class Something
      def do_stuff(with_what)
        i = 10
      end
    end


!SLIDE code

## to s-expression

    $ parse_tree_show something.rb
    s(:class,
     :Something,
     nil,
     s(:scope,
      s(:defn,
       :do_stuff,
       s(:args, :with_what),
       s(:scope, s(:block, s(:lasgn, :i, s(:lit, 10)))))))



!SLIDE

# what can ParseTree do?

