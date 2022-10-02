# frozen_string_literal: true

require './lib/linked_list'

describe LinkedList do
  describe '#append' do
    it 'appends an element to the linked list (to the end)' do
      list = LinkedList.new
      list.append('Bryan')
      expect(list.head.data).to eql('Bryan')
      expect(list.head.next_node).to eql(nil)
      expect(list.tail.data).to eql('Bryan')
      expect(list.tail.next_node).to eql(nil)
    end

    it 'appends another element to the linked list and has the correct reference to the next node' do
      list = LinkedList.new
      list.append('Bryan')
      list.append('Marco')
      expect(list.head.data).to eql('Bryan')
      expect(list.head.next_node.data).to eql('Marco')
      expect(list.tail.data).to eql('Marco')
      expect(list.tail.next_node).to eql(nil)
    end
  end

  describe '#prepend' do
    it 'adds an element to the beginnning of the list' do
      list = LinkedList.new
      list.prepend('Louis')
      list.prepend('Miguel')
      expect(list.head.next_node.data).to eql('Louis')
      expect(list.head.data).to eql('Miguel')
      expect(list.head.next_node.next_node).to eql(nil)
    end
  end

  describe '#size' do
    it 'returns the size (length) of the linked list' do
      list = LinkedList.new
      list.append(1)
      list.append(2)
      list.append(3)
      expect(list.size).to eql(3)
    end
  end

  describe '#head' do
    it 'returns the first node in the list' do
      list = LinkedList.new
      list.append('Head')
      expect(list.head.data).to eql('Head')
    end
  end

  describe '#tail' do
    it 'returns the last node in the list' do
      list = LinkedList.new
      list.append('Tail')
      expect(list.tail.data).to eql('Tail')
    end
  end

  describe '#at(index)' do
    list = LinkedList.new
    list.append(0)
    list.append(1)
    list.append(2)
    list.append(3)
    list.append(4)
    list.append(5)
    list.append(6)
    it 'returns the node at the given index' do
      expect(list.at(0).data).to eql(0)
    end

    it 'goes backwards in to the list' do
      expect(list.at(-2).data).to eql(5)
    end
  end

  describe '#pop' do
    list = LinkedList.new
    list.append(0)
    list.append(1)
    list.append(2)
    list.append(3)
    list.append(4)
    list.append(5)
    it 'removes the last node inside of the list' do
      expect(list.pop.data).to eql(5)
    end
  end

  describe '#contains?' do
    it 'returns true if element passed is inside list' do
      list = LinkedList.new
      list.append(0)
      list.append(1)
      list.append(2)
      list.append(0)
      list.append(4)
      list.append(5)
      list.append(6)
      expect(list.contains?(4)).to eql(true)
      expect(list.contains?(9)).not_to eql(true)
    end
  end

  describe '#find(value)' do
    list = LinkedList.new
    list.append('Noel') #=> 0
    list.append('Bert') #=> 1
    list.append('Roger') #=> 2
    list.append('Lisa') #=> 3
    it 'returns the index of the element passed' do
      expect(list.find('Lisa')).to eql(3)
      expect(list.find('Marco')).to eql(nil)
      expect(list.find('Bert')).to eql(1)
      list.prepend('Hera')
      list.pop
      list.prepend('Fathi')
      expect(list.find('Hera')).to eql(1)
    end

    it 'returns nil if the value passed does not match' do
      expect(list.find('Norbert')).to eql(nil)
    end
  end

  describe '#to_s' do
    list = LinkedList.new
    list.append('Miguel')
    list.append('Michele')
    it 'returns a chained list of all the elements inside of the list' do
      expect(list.to_s).to eql('( Miguel ) => ( Michele ) => ( null )')
    end
  end

  
end
