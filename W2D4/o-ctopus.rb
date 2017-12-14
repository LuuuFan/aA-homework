require 'byebug'

def sluggish_octopus(arr)
  i = arr.length - 1
  while i > 0
    j = 0
    while j < i
      arr[j], arr[j + 1] = arr[j + 1], arr[j] if arr[j].length > arr[j + 1].length
      j += 1
    end
  i -= 1
  end
  arr.last
end

p sluggish_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']) == "fiiiissshhhhhh"

def dominant_octopus(arr)
  merge_sort(arr).last
end

def merge_sort(arr)
  return arr if arr.length <= 1
  left = arr[0..arr.length / 2 - 1]
  right = arr[arr.length / 2..-1]
  # debugger
  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  arr = []
  # debugger
  until left.empty? && right.empty?
    if left.empty? || right.empty?
      left.empty? ? arr << right.shift : arr << left.shift
    elsif left.first.length < right.first.length
      arr << left.shift
    else
      arr << right.shift
    end
  end
  arr
end

p dominant_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']) == "fiiiissshhhhhh"

def clever_octopus(arr)
  biggist_fish = ''
  arr.each do |fish|
    biggist_fish = fish if fish.length > biggist_fish.length
  end
  biggist_fish
end

p clever_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']) == "fiiiissshhhhhh"


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(tile, tiles_array)
  tiles_array.each_with_index{ |t, idx| return idx if t == tile }
  nil
end

p slow_dance('up', tiles_array)
p slow_dance('right-down', tiles_array)

def constant_dance(tile, new_tiles_data_structure)
  new_tiles_data_structure[tile]
end

new_tiles_data_structure = Hash.new
tiles_array.each_with_index { |tile, idx| new_tiles_data_structure[tile] = idx }
p constant_dance('up', new_tiles_data_structure)
p constant_dance('right-down', new_tiles_data_structure)
