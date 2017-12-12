def sum_to(num)
  return nil if num <= 0
  return num if num == 1
  num + sum_to(n - 1)
end

# Test Cases
# p  sum_to(5)  # => returns 15
# p  sum_to(1)  # => returns 1
# p  sum_to(9)  # => returns 45
# p  sum_to(-8)  # => returns nil

def add_numbers(arr)
  return nil if arr.empty?
  return arr[0] if arr.length == 1
  arr.shift + add_numbers(arr)
end
#
# # Test Cases
# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil

def gamma_fnc(num)
  return nil if num == 0
  return 1 if num == 1
  (num - 1) * gamma_fnc(num - 1)
end

# # Test Cases
# p gamma_fnc(0)  # => returns nil
# p gamma_fnc(1)  # => returns 1
# p gamma_fnc(4)  # => returns 6
# p gamma_fnc(8)  # => returns 5040


def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  if flavors[0] == favorite && flavors.length == 1
    return true
  else
    pick_one_flavors = flavors.sample
    flavors.delete(pick_one_flavors) unless pick_one_flavors == favorite
    ice_cream_shop(flavors, favorite)
  end
end

# # Test Cases
p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
p ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(str)
  return str if str.length <= 1
  str[-1] + reverse(str[0..str.length - 2])
end

# Test Cases
# p reverse("house") # => "esuoh"
# p reverse("dog") # => "god"
# p reverse("atom") # => "mota"
# p reverse("id") # => "di"
# p reverse("q") # => "q"
# p reverse("") # => ""
