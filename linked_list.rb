Node = Struct.new(:value, :next_node)

class LinkedList

  attr_reader :root, :tail, :size

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

  def at(index)
    return nil if index < 0 || index >= size
    pointer = root
    index.times do
      pointer = pointer.next_node
    end
    pointer
  end

  def pop
    self.remove_at(size - 1)
  end

  def contains?(value)
    pointer = root
    until pointer == nil do
      return true if pointer.value == value
      pointer = pointer.next_node
    end
    false
  end

  def find(value)
    pointer = root
    index = 0
    until pointer == nil do
      return index if pointer.value == value
      index += 1
      pointer = pointer.next_node
    end
    nil
  end

  def insert_at(value, index)
    return if index < 0 || index > size

    if index == 0
      self.prepend(value)
      return
    elsif index == size
      self.append(value)
      return
    end

    pointer = root
    (index - 1).times do
      pointer = pointer.next_node
    end

    temp = pointer.next_node
    pointer.next_node = Node.new(value, temp)
    self.size += 1
  end

  def remove_at(index)
    return if root == nil || index < 0 || index >= size

    if index == 0
      self.root = root.next_node
      self.size -= 1
      self.tail = nil if size <= 0
      return
    end

    pointer = root
    (index - 1).times do
      pointer = pointer.next_node
    end
    pointer.next_node = pointer.next_node.next_node
    self.tail = pointer if pointer.next_node == nil
    self.size -= 1
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


  private

  attr_writer :root, :tail, :size
end