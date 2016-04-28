class Node
  attr_reader :score, :title, :depth, :hashify
  attr_accessor :left, :right

  def initialize(score,title,depth)
    @score = score
    @title = title
    @depth = depth
    @left = nil
    @right = nil
    @hashify = {title=>score}
  end

  def find_depth(score,title)
    depth = @depth + 1
    if score < @score
      move_left(score,title,depth)
    elsif score > @score
      move_right(score,title,depth)
    else
      puts "This value has already been entered!"
      nil
    end
  end

  def move_left(score,title,depth)
    if @left.nil?
      new_left(score,title,depth)
    else
      @left.find_depth(score,title)
    end
  end

  def move_right(score,title,depth)
    if @right.nil?
      new_right(score,title,depth)
    else
      @right.find_depth(score,title)
    end
  end

  def new_right(score,title,depth)
    @right = Node.new(score,title,depth)
    depth
  end

  def new_left(score,title,depth)
    @left = Node.new(score,title,depth)
    depth
  end

  def exists_left
    !@left.nil?
  end

  def exists_right
    !@right.nil?
  end

end
#
#Should have method in test file where ing 4 bases cases. Create initial tree.
#put  and stuff in here to make sure that it's recursive. If the nodes are
#by the point that
#if node < root, set node = nil.left
#if node > root, set node = nil.right
#if correct right link nil, set equal to node
#if correct left link nil, set equal to node
#then recursion (need to keep traveling down)
#making nodes intelligent using recursion - lets it go down tree. Each node has own
#test for each behavior of unit, acceptance test is a high-depth test that passes entire concept.
#Should try to test combining some of the method. Acceptance test.
#Make sure right test data. Left and right. Base case for testing. After  call other methods (finding node, highest value of node, etc.)
#Make sure that everything works b itself.
#For testing, there isn't a max. 10-15 lines.
#Each test should correspond to a class
#Node, tree, BST classes - both node & tree unit, BST the high-depth
#Work in spiral: first write all names of methods in pseudocode, so you're evaluating the behavior of program before writing
