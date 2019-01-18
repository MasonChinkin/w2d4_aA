# O(n^2)
def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |ele1, i1|
    arr.each_with_index do |ele2, i2|
      return true if i2 > i1 && ele1 + ele2 == target_sum
    end
  end
  false
end

# O(n log n)
def okay_two_sum?(arr, target)
  arr.sort.each_index do |i|
    check_num = arr[i]
    check_arr = arr[0...i] + arr[i+1..-1]
    return true if bsearch?(check_arr, check_num, target)
  end
  false
end

# O(log n)
def bsearch?(arr, num, target)
  return false if arr.length == 1 && arr[0] + num != target

  mid = arr.length / 2
  left = arr.take(mid)
  right = arr.drop(mid+1)

  case arr[mid] + num == target
  when true
    return true
  when false
    if target < arr[mid]
      bsearch?(left, num, target)
    else
      bsearch?(right, num, target)
    end
  end
end

def better_two_sum?(arr, target)
  hash = {}
  arr.each do |ele|
    return true if hash[target_sum - el]
    hash[el] = true
  end
  false
end

if __FILE__ == $PROGRAM_NAME
  # arr1 = [0, 1, 5, 7]
  # p bad_two_sum?(arr1, 6) # => should be true
  # p bad_two_sum?(arr1, 10) # => should be false

  arr2 = (-5..5).to_a
  # p okay_two_sum?(arr2, 5)
  better_two_sum?(arr2, 8)
  better_two_sum?(arr2, 9)
end