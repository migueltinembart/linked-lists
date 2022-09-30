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
    # adds element add the beginning of the list
    def prepend(value)
        next_element = @head
        @head = Node.new(value, next_element)

    end
    

end