require './node.rb'
require 'minitest/autorun'
require 'minitest/pride'

class NodeTest < Minitest::Test

  def test_make_sure_score_stored
    node = Node.new(1,"Super Babies: Baby Geniuses 2",0)
    assert_equal node.score,1
  end

  def test_make_sure_title_scored
    node = Node.new(70,"Fargo",0)
    assert_equal node.title,"Fargo"
  end

  def test_data_stored_as_hash
    node = Node.new(30, "IT",0)
    assert_equal "IT",node.hashify.key(30)
    assert_equal 30,node.hashify["IT"]
  end

  def test_goes_to_left_node_if_value_less
    node = Node.new(60,"Juno",0)
    node.find_depth(54,"Along Came Polly")
    assert_equal 54, node.left.score
    assert_equal "Along Came Polly", node.left.title
  end

  def test_goes_to_right_node_if_value_greater
    node = Node.new(40,"Waterworld",0)
    node.find_depth(70,"The Big Lebowski")
    assert_equal 70, node.right.score
    assert_equal "The Big Lebowski",node.right.title
  end

  def test_keeps_same_title_when_score_entered_again
    node=Node.new(89,"Casablanca",0)
    node.find_depth(89,"All About Eve")
    assert_equal "Casablanca", node.title
  end

  def test_needs_to_return_value_of_depth_for_move_right
    node = Node.new(40,"Waterworld",0)
    assert_equal node.find_depth(70,"The Big Lebowski"),1
  end

  def test_increases_depth_by_1_for_each_depth
    node = Node.new(50,"Happy Gilmore",0)
    assert_equal node.find_depth(75,"The Wedding Singer"),1
    assert_equal node.find_depth(83,"Punch-Drunk Love"),2
  end

  def test_if_unlinked_node_has_left_link
    node = Node.new(5,"Gigli",0)
    refute node.exists_left
  end

  def test_if_unlinked_node_has_right_link
    node = Node.new(20,"Gigli",0)
    refute node.exists_right
  end

end
