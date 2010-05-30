!SLIDE title-slide

# example idea:

## find unused (not-called) methods in class

## ParseTree makes it an easy hack

!SLIDE code
    @@@ Ruby
    require 'other_class2'
    
    sexp_array = ParseTree.translate(OtherClass2)
    found = Array.new
    found << traverse(sexp_array, :defn)
    
    call_counter = {}
    found.each{|m| call_counter[m[1]] = 0}
    
    found = Array.new
    found << traverse(sexp_array, :vcall)
    found << traverse(sexp_array, :fcall)
    found << traverse(sexp_array, :call)
    
    found.each{|cl| call_counter[cl[1]] += 1 if(call_counter[cl[1]])}
    
    => {:first_method=>2, :second_method=>1, :third_method=>0}
