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
  # adds element add the beginning of the list
  def prepend(value)
    next_element = @head
    @head = Node.new(value, next_element)
  end

  ##
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
    pointer = nil if index >= size
    pointer
  end

  ##
  # removes the last element of the list
  def pop
    item = at(-1)
    at(-2).next_node = nil
    item
  end

  ##
  # returns true if value is contained inside of list nodes
  def contains?(value)
    pointer = @head
    contains = false
    until pointer.nil?
      contains = true if pointer.data == value
      pointer = pointer.next_node
    end
    contains
  end

  ##
  # returns index of the element passed in to function
  def find(value)
    pointer = @head
    matched = nil
    index = 0
    until pointer.nil?
      matched = index if pointer.data == value
      index += 1
      pointer = pointer.next_node
    end
    matched
  end

  ##
  # returns a list of elements in order of the list
  def to_s
    string = ''
    pointer = @head
    until pointer.nil?
      string += "( #{pointer.data} )"
      string += ' => ' unless pointer.nil?
      string += '( null )' if pointer.next_node.nil?
      pointer = pointer.next_node
    end
    string
  end

  ##
  # inserts new element at specified index
  def insert_at(value, index)
    return nil if index > size
    return nil if index.negative?

    new_node = Node.new(value, at(index))
    at(index - 1).next_node = new_node
    @head = new_node if index.zero?
    @tail = new_node.next_node if index == size
  end

  ##
  # removes the item at the index
  def remove_at(index)
    result = nil
    if index.zero?
      result = @head
      @head = head.next_node
      return result
    end
    index = size + index if index.negative?

    result = at(index)
    at(index - 1).next_node = at(index).next_node
    result.data
  end
end
