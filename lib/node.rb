# frozen_string_literal: true

##
# This class represents a data node which points to another data structure
class Node
  attr_accessor :data, :next_node

  ##
  # returns a node object which can hold any element and can point to another value
  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end
end
