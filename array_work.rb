class Array

  def my_uniq
    uniq = []
    self.each { |item| uniq << item unless uniq.include?(item) }
    uniq
  end

end