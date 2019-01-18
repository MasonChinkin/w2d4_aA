# O(n!) time, O(n!) space
def first_anagram?(str1, str2)
	anagrams = str1.chars.permutation.to_a
	anagrams.include?(str2.chars)
end

# O(n^2) time, O(n) 
def second_anagram?(str1,str2)
	str2_arr = str2.chars
	str1.chars.each do |char|
		char_i = str2_arr.index(char)
		return false if char_i.nil?
		str2_arr.delete_at(char_i)
	end
	return true if str2_arr.length == 0
end

# O(n log n) time, O(1) space
def third_anagram?(str1, str2)
	str1.chars.sort == str2.chars.sort
end

# 0(n) time, O(1) space 
def fourth_anagram?(str1, str2)
	hash1 = Hash.new(0)
	hash2 = Hash.new(0)

	str1.each_char {|char| hash1[char] += 1}
	str2.each_char {|char| hash2[char] += 1}

	hash1 == hash2
end

# with only 1 hash
# O(n) time, O(1) space
def fifth_anagram?(str1, str2)
	hash = Hash.new(0)

	str1.each_char {|char| hash[char] += 1}
	str2.each_char {|char| hash[char] -= 1}

	hash.values.all? {|v| v == 0}
	# hash.all? { |k , v| v == 0 }
end

if __FILE__ == $PROGRAM_NAME
	p fifth_anagram?('hello', 'lohle')
end