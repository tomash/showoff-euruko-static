class OtherClass
  def first_method(arg)
    puts(arg)
  end

  def second_method
    first_method("second")
  end

  def third_method
    first_method("third")
    second_method
  end
end
