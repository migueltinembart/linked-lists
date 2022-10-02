# frozen_string_literal: true

##
# This class represents a standard linked list
class LinkedList
  require_relative 'node'
  attr_reader :head, :tail

  ##
  # initalizes linked list head and tail set as nil

  def initialize
    @head = nil
    @tail = nil
  end

  ##
  # #append(value)
  # adds an element to the end of the list
  def append(value)
    new_node = Node.new(value)
    @head ||= new_node
    if !@tail
      @tail = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  ##
  # #prepend(value)
  # adds element add the beginning of the list
  def prepend(value)
    next_element = @head
    @head = Node.new(value, next_element)
  end

  ##
  # #size
  # returns the size of the list
  def size
    count = 0
    pointer = @head
    until pointer.nil?
      count += 1
      pointer = pointer.next_node
    end
    count
  end

  ##
  # get the node at the index of the list
  def at(index)
    index = size + index if index.negative?
    counter = 0
    pointer = @head
    until counter == index
      pointer = pointer.next_node
      counter += 1
    end
    pointer
  end

  ##
  # removes the last element of the list
  def pop
    item = at(-1)
    at(-2).next_node = nil
    item
  end
end
