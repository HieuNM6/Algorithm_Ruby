module LinkedList
  # Implement linked list
  class Node
    attr_accessor :node, :next
    def initialize(node, next_node = nil)
      @node = node
      @next = next_node
    end

    class << self
      def node_list(node, msg = nil)
        msg ||= ''
        return msg[0..-4] if node.nil?
        msg << "#{node.node} ->"
        node_list(node.next, msg)
      end

      def last(node)
        return node if node.next.nil?
        last(node.next)
      end

      def reverse(node)
        return node if node.next.nil?
        head, swap, node.next = assignt node.next, node, nil
        link = head.next
        until link.nil?
          head.next, swap, head, link = assignt swap, head, link, link.next
        end
        head.next = swap
        head
      end

      private

      def assignt(*args)
        args
      end

      def swap
      end
    end
  end

  # Implement Stack using linked list
  class Stack
    def intialize
      @first = nil
    end

    def push(node)
      @first = Node.new(node, @first)
    end

    def pop
      raise 'Stack is emtpy' if empty?
      node = @first.node
      @first = @first.next
      node
    end

    def empty?
      @first.nil?
    end
  end

  # Implement Queue using linked list
  class Queue
    def initialize
      @rear = nil
      @front = nil
    end

    def enqueue(node)
      if @front.nil? && @rear.nil?
        @rear = Node.new(node)
        @rear = @front
      else
        @rear = Node.new(node, @front)
      end
    end

    def shift
    end
  end
end
