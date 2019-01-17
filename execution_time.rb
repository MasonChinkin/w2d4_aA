MY_MIN = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
LIST = [2, 3, -6, 7, -6, 7]
class Array
	# Phase 1
  # def my_min
  #   self.each_index do |i|
  #     new_arr = self[0...i] + self[i+1..-1]
  #     return self[i] if new_arr.uniq.all? { |ele| ele > self[i] }
  #   end
  # end

	# Phase 2
	def my_min
		min = self.shift
		self.each do |ele|
			min = ele if ele < min
		end
		min
	end

	# Phase 1
	# def my_largest_sub_sum
	# 	new_arr = []
	# 	self.each_index do |i|
	# 		i.upto(self.length - 1) do |j|
	# 			new_arr << self[i..j].reduce(:+)
	# 		end
	# 	end
	# 	new_arr.max
	# end

	# Phase 2
	def my_largest_sub_sum
		max_sum = self[0]
		current_sum = self[0]
		new_self = self.drop(1)
		new_self.each_index do |i|
			p "current: #{current_sum}"
			p "max: #{max_sum}"
			current_sum = 0 if current_sum < 0
			current_sum += new_self[i]
 			max_sum = current_sum if current_sum > max_sum
		end
		max_sum
	end

	# provided 0(n) time, 0(1) space
	# def my_largest_sub_sum
  # largest = self.first
  # current = self.first

  # return self.max if self.all? { |num| num < 0 }

	# self.drop(1).each do |num|
	# 	p "current: #{current}"
	# 	p "max: #{largest}"
  #   current = 0 if current < 0
  #   current += num
  #   largest = current if current > largest
  # end

  # largest
	# end
end

if __FILE__ == $PROGRAM_NAME

	p LIST.my_largest_sub_sum
	
end