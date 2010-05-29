!SLIDE title-slide

# ParseTree

## ruby code into s-expressions


!SLIDE code

    @@@ Ruby
    class Something
      def do_stuff(with_what)
        i = 10
      end
    end


!SLIDE code

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
