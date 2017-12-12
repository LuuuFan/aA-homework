require 'byebug'

def factorial(n)
  return 1 if n == 1
  n * factorial(n - 1)
end

# if __FILE__ == $PROGRAM_NAME
#   p factorial(6)
#   p factorial(7)
#   p factorial(8)
# end

def quick_sort(arr)
  return arr if arr.length <= 1
  pivot_arr = [arr.first]
  left_side = arr[1..-1].select{ |el| el < pivot_arr[0] }
  right_side = arr[1..-1].select{ |el| el >= pivot_arr[0] }
  quick_sort(left_side) + pivot_arr + quick_sort(right_side)
end
#
# p quick_sort([1,5,8,2,0,3,6,8,1,5])

def range(s, e)
  return [] if e <= s
  range(s, e -1) + [e - 1]
end

def exponentiation(b, n)
  return 1 if n == 0
  b * exponentiation(b, n - 1)
end

def exp(b, n)
  return 1 if n == 0
  return b if n == 1
  return exp(b, n / 2)**2 if n.even?
  return b * exp(b, (n - 1) / 2)**2 if n.odd?
end

class Array
  def deep_dup
    arr = []
    self.each { |el| el.is_a?(Array) ? arr << el.deep_dup : arr << el}
    arr
  end
end
#
# a = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# a_copy = a.deep_dup

# a_copy[1] << "LEDs"
# p "The first element of a_copy is #{a_copy[1]}"
# p "The first element of a is #{a[1]}"
# p [1, [2], [3, [4]]].deep_dup

def fibonacci(n)
  return 0 if n == 0
  return 1 if n == 1
  fibonacci(n - 1) + fibonacci(n - 2)
end


def fibonacci_iterative(n)
  arr = [0, 1]
  while arr.length < n
    arr << arr[-2] + arr.last
  end
  # p arr
  arr.last
end

def subsets(arr)
  return [[]] if arr.empty?
  return [[], arr] if arr.length == 1
  # debugger
  last_el =[arr.pop]
  old_arr = subsets(arr)
  old_arr + old_arr.map{ |el| el += last_el }
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(arr)
  return arr if arr.length <= 1
  return [arr, arr.reverse] if arr.length == 2
  last_el = arr.pop
  old_arr = arr.deep_dup
  arr = []
  permutations(old_arr).each do |el|
    (0..el.length).each do |pos|
      base_el = el.deep_dup
      arr += [base_el.insert(pos, last_el)]
    end
  end
  arr
end

def bsearch(arr, target)
  return nil if arr.length <=1 && arr[0] != target
  return 0 if arr.count == 1 && arr[0] == target
  left_arr = arr[0..arr.length / 2 - 1]
  right_arr = arr[arr.length / 2 + 1..-1]
  mid_idx = arr.length / 2
  if arr[mid_idx] == target
    return mid_idx
  elsif arr[mid_idx] > target
    bsearch(left_arr, target)
  else
    bsearch(right_arr, target).nil? ? nil : bsearch(right_arr, target) + mid_idx + 1
  end
end

def merge_sort(arr)
  return arr if arr.length <= 1
  left_arr = arr[0..arr.length / 2 - 1]
  right_arr = arr[arr.length / 2..-1]
  # debugger
  merge(merge_sort(left_arr), merge_sort(right_arr))
end

def merge(arr1, arr2)
  arr = []
  length = arr1.length + arr2.length
  while arr.length < length
    if arr1.first.nil? || arr2.first.nil?
      arr1.first.nil? ? arr << arr2.shift  : arr << arr1.shift
    elsif arr1.first <= arr2.first
      arr << arr1.shift
    else
      arr << arr2.shift
    end
  end
  arr
end

def make_change(amount, coins = [25, 10, 5, 1])
  static_amount = amount
  best_change = []
  correct_coin = coins.select { |coin| amount % coin == 0}

  if correct_coin.first != 1
    (amount / correct_coin.first).times do
      best_change << correct_coin.first
    end
    return best_change
  elsif amount < coins[-2]
    (amount / correct_coin.first).times do
      best_change << correct_coin.first
    end
    return best_change
  end

  coins.each do |coin|
    (amount / coin).times do best_change << coin end
    amount = amount % coin
  end


  if static_amount >= coins.first
    biggest_coin = coins.shift unless coins.empty?
    (1..static_amount / biggest_coin - 1).to_a.reverse.each do |time|
      change = []
      time.times do change << biggest_coin end
      debugger
      change.concat(make_change(static_amount - change.inject(0, :+), coins))
      best_change.length > change.length ? best_change = change : best_change
    end
  end
  best_change

end

# This file will be uploaded to Git
