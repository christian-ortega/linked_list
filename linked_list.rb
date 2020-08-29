Node = Struct.new(:value, :next_node)

class LinkedList

  attr_accessor :root, :tail, :size

  def initialize
    @root = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    if root == nil
      self.root = Node.new(value)
      self.tail = root
    else
      tail.next_node = Node.new(value)
      self.tail = tail.next_node
    end
    self.size += 1
  end

  def prepend(value)
    if root == nil
      self.root = Node.new(value)
      self.tail = root
    else
      temp = root
      self.root = Node.new(value, temp)
    end
    self.size += 1
  end

  def to_s
    pointer = root
    list_as_string = ""
    until pointer == nil do
      list_as_string += "( #{pointer.value} ) -> "
      pointer = pointer.next_node
    end
    list_as_string += "nil"
  end
end

list = LinkedList.new
5.times do |i|
  list.append(i)
  list.prepend(i)
end
p list.to_s