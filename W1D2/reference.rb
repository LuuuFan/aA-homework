x = 'string'
y = x
x << ' addtional string'  # y => 'string addtional string'
x +=  ' addtional string' # y => 'string'

arr = []
arr_y = arr
arr << 3 # arr_y => [3]

x_3 = Array.new(3, [])
x_3[0] << 'Hello' # x_3 => [['Hello'],['Hello'],['Hello']]

y_3 = Array.new(3){[]}
y_3[0] << 'Hello' # y_3 =>[['Hello'], [], []]


def add_to_array!(array, item)
  array << item
end

my_array = []
add_to_array!(my_array, "an item!")
# p my_array

my_object = Object.new
# my_object now refers to a new instance of Object

my_object = Object.new
# a new Object instance is created, and the my_object variable is
# reassigned so that it now refers to this object, rather than the old
# object.

# call `my_method` on the object that `my_object` refers to
# my_object.my_method

arr2 = Array.new(3, 1)

arr2[0] += 1
arr2[0] == 2
arr2[1] == 1
arr2[2] == 1

xl = 7
def foo(xl)
  xl = 10
end

foo(xl)
p xl
