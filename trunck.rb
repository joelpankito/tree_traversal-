class Tree
    attr_accessor :payload, :children
  
    def initialize(payload, children)
      @payload = payload
      @children = children
    end
  
end
  
  
# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])
puts "depth for search"
$flag = true

def depth_first_serch(node)
    return if node == []
    
    puts node.payload
    if node.payload == 11
        $flag = false
    end
    node = node.children
    node.each do |i|
        if $flag
            depth_first_serch(i)
        end
    end
    
end


depth_first_serch(trunk)

puts "Breath for search"

class MyQueue
    def initialize
      @queue = []
    end
  
    def enqueue(item)
      @queue.push(item)
    end
  
    def dequeue
      @queue.shift
    end
end

$queue = MyQueue.new
$flag = true

def breath_first_search(node)
    
    return if node == nil
    
    puts node.payload
    
    node_ch = node.children
    node_ch.each do |i|
        $queue.enqueue(i)   
    end

    if node.payload == 11
        $flag = false
    end

    if $flag
        breath_first_search($queue.dequeue)
    end
end

breath_first_search(trunk)
