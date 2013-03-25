class Array

  def my_uniq
    uniq = []
    self.each { |item| uniq << item unless uniq.include?(item) }
    uniq
  end

  def two_sum
    return true if self.count(0) > 1
    self.any? { |item| self.include?(-item) unless item == 0 }
  end


end