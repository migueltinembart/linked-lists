require './lib/linked_list'

describe LinkedList do
  list = LinkedList.new
  describe '#append' do
    it 'appends an element to the linked list (to the end)' do
      list.append('Bryan')
      expect(list.head.data).to eql('Bryan')
      expect(list.head.next_node).to eql(nil)
      expect(list.tail.data).to eql('Bryan')
      expect(list.tail.next_node).to eql(nil)
    end

    it 'appends another element to the linked list and has the correct reference to the next node' do
      list.append('Marco')
      expect(list.head.data).to eql('Bryan')
      expect(list.head.next_node.data).to eql('Marco')
      expect(list.tail.data).to eql('Marco')
      expect(list.tail.next_node).to eql(nil)
    end
  end

  describe '#prepend' do
    it 'adds an element to the beginnning of the list'
  end

  describe '#size' do
    it 'returns the size (length) of the linked list'
  end

  describe '#head' do
    it 'returns the first node in the list'
  end

  describe '#tail' do
    it 'returns the last node in the list'
  end

  describe '#at(index)' do
    it 'returns the node at the given index'
  end

  describe '#pop' do
    it 'removes the last node inside of the list'
  end

  describe '#contains?' do
    it
  end
end
