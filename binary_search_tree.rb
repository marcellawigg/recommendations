require './node.rb'
require 'pry'

class BinarySearchTree
  attr_accessor :head
  attr_reader :health_arr

  def initialize
    @head = nil
    @health_arr = []
  end

  def insert(score,title)
    if @head.nil?
      make_head(score,title)
    else
      @head.find_depth(score,title)
    end
  end

  def make_head(score,title)
    @head = Node.new(score,title,0)
    0
  end

  def include?(score)
    if @head.nil?
      nil
    else
      include_with_values(@head,score)
    end
  end


  def include_with_values(node,comparison_score)
    if node.score == comparison_score
      true
    elsif node.score > comparison_score && node.exists_right
      include_with_values(node.right,comparison_score)
    elsif node.exists_left
      include_with_values(node.left,comparison_score)
    else
      false
    end
  end

  def depth_of(score)
    if @head.nil?
      nil
    else
      depth_of_values(@head,score)
    end
  end

  def depth_of_values(node,score)
    if node.score == score
      node.depth
    elsif score > node.score && node.exists_right
      depth_of_values(node.right,score)
    elsif node.exists_left
      depth_of_values(node.left,score)
    else
      nil
    end
  end

  def max(node)
    if node.nil?
      nil
    else
      max_value(node)
    end
  end

  def max_value(node)
    if node.nil?
      nil
    else max_value(node)
    end
  end

  def min(node)
    if node.nil?
      nil
    else min_value(node)
    end
  end

  def min_value(node)
    return node.hashify unless node.exists_left
    min(node.left)
  end


  def push_health(node)
    children = child_nodes_count(node)
    @health_arr.push[node.score,children,(children/total_count(@head) * 100).round]
  end

  def health(node)
    if node.nil?
      nil
    else
      node.health_values(@head,0)
    end
  end

  def health_values(node,depth)
    push_health(node) if depth == node.depth
    health(node.left,depth) if exists_left
    health(node.right,depth) if exists_right
    @health_arr
  end

  def sort(node)
    sorted_array = []
    if node.nil?
      nil
    else
      sort(node.left) if node.left.exists_left
      sorted_array.push(node.hashify)
      sort(node.right) if node.right.exists_right
      sorted_array.push(node.hashify)
      sorted_array
    end
  end


  def child_nodes_count(node)
    count = 0
    count+= child_nodes_count(node.left) if node.exists_left
    count+= child_nodes_count(node.right) if node.exists_right
    count += 1
    count
  end

  def total_count(node)
    count = 0
    count += total_count(node.right) if node.exists_right
    count += 1
    count += total_count(node.left) if node.exists_left
  end

  def load(file_name)
    file_reader = read_file(file)
    array_of_film = file_reader.read_file(file_name)
    array_of_film.each do |node|
      insert(node[0].to_i, node[1].chomp)
    end
    array_of_film.length
  end

  def read_file(file_name)
    array = File.open(file_name).readlines.map do |line|
      line.split(", ")
    end
    array
  end
end
