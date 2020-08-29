Node = Struct.new(:value, :next_node)

class LinkedList

  attr_accessor :root

  def initialize
    @root = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    if root == nil
      self.root = Node.new(value)
      self.tail = root
      self.size += 1
    else
      tail.next_node = Node.new(value)
      self.tail = tail.next_node
      self.size += 1
    end
  end
end