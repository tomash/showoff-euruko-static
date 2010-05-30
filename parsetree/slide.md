!SLIDE

# static code analysis?
## use ParseTree


!SLIDE title-slide

# ParseTree

## ruby code into s-expressions

### (lisp geeks (might(explain (more))))


!SLIDE code

## from Ruby

    @@@ Ruby
    class SomeClass
      def do_stuff(with_what)
        i = 10
      end
    end


!SLIDE code

## to s-expression, command line

    $ parse_tree_show some_class.rb
    s(:class,
     :SomeClass,
     nil,
     s(:scope,
      s(:defn,
       :do_stuff,
       s(:args, :with_what),
       s(:scope, s(:block, s(:lasgn, :i, s(:lit, 10)))))))


!SLIDE

# how about from inside Ruby?


!SLIDE code

    @@@ Ruby
    class OtherClass
      def first_method
      end
    
      def second_method
        first_method
      end
    
      def third_method
        first_method
        second_method
      end
    end


!SLIDE code

    @@@ Ruby
    sexp_array = ParseTree.translate(OtherClass)
    pp sexp_array
      [:class,
       :OtherClass,
       [:const, :Object],
       [:defn, :first_method, 
         [:scope, 
           [:block, [:args], [:nil]]]],
       [:defn, :second_method, 
         [:scope, 
           [:block, [:args], [:vcall, :first_method]]]],
       [:defn,
        :third_method,
        [:scope,
         [:block, [:args], 
           [:vcall, :first_method], 
           [:vcall, :second_method]]]]]
    => nil


!SLIDE

# practical applications of ParseTree?

