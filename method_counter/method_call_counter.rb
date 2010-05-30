require 'rubygems'
require 'parse_tree'
require 'pp'

require 'other_class'

$methods = []
def traverse(entity, detect=nil)
  if(entity.is_a?(Array) && entity[0] == detect)
    $methods << entity
  elsif(entity.is_a?(Array))
    entity.each{|e| traverse(e, detect)}
  else
    #fuck it
  end
end

sexp_array = ParseTree.translate(OtherClass2)
traverse(sexp_array, :defn)
methods = $methods.clone

call_counter = {}
methods.each{|m| call_counter[m[1]] = 0}

$methods = []
traverse(sexp_array, :vcall)
traverse(sexp_array, :fcall)
traverse(sexp_array, :call)
calls = $methods.clone

calls.each{|c| call_counter[c[1]] += 1 if(call_counter[c[1]])}
pp call_counter.inspect
