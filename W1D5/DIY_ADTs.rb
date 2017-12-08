class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    arr = []
    @stack.each { |el| arr << el }
    arr
  end

  attr_reader :stack
end

p stack = Stack.new
p stack.add("I'm the first")
p stack.add("I'm the second")
p stack.add("I'm the last")
p stack.remove
p stack.show

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    queue << el
  end

  def dequeue
    queue.shift
  end

  def show
    arr = []
    queue.each { |el| arr << el}
    arr
  end

  attr_reader :queue
end

p queue = Queue.new
p queue.enqueue("I'm the first customer")
p queue.enqueue("I'm the second customer")
p queue.enqueue("I'm the third customer")
p queue.dequeue
p queue.show

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    exist_index = nil
    map.each_with_index do |el, idx|
      if el.first == key
        exist_index = idx
        break
      end
    end
    exist_index.nil? ? map << [key, value] : map[exist_index] = [key, value]
  end

  def lookup(key)
    exist_index = nil
    map.each_with_index do |el, idx|
      if el.first == key
        exist_index = idx
        break
      end
    end
    exist_index.nil? ? nil : map[exist_index]
  end

  def remove(key)
    exist_index = nil
    map.each_with_index do |el, idx|
      if el.first == key
        exist_index = idx
        break
      end
    end
    exist_index.nil? ? nil : map.delete(exist_index)
  end

  def show
    deep_dup(map)
  end

  attr_reader :map
  private
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el}
  end


end

p map = Map.new
p map.assign('cat', 'shasha')
p map.assign('dog', 'night')
p map.show
p map.lookup('dog')
p map.remove('dog')
p map.show
p map.lookup('cat')
p map.lookup('dog')
