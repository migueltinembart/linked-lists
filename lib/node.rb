##
# This class represents a data node which points to another data structure

class Node

    attr_accessor = :data, :pointer

    ##
    # initialize node with nil as standard values
    #
    def initialize(data = nil, pointer = nil)
        @data = data
        @pointer = pointer
    end

end