gem 'minitest', '~> 5.2'
require './binary_search_tree.rb'
require 'minitest/autorun'
require 'minitest/pride'
class BinarySearchTreeTest < Minitest::Test

  def test_if_insert_works
    tree = BinarySearchTree.new
    assert_equal tree.insert(46,"Batman vs. Superman"),0
  end

  def test_if_will_only_assign_head_once
    tree = BinarySearchTree.new
    assert_equal tree.insert(61, "Bill & Ted's Excellent Adventure"),0
    assert_equal tree.insert(16, "Johnny English"),1 #shows it isn't the head, since every time head is created reset to 0
  end

  def test_will_make_head_return_0
    tree = BinarySearchTree.new
    assert_equal tree.make_head(92, "Sharknado 3"),0
  end

  def test_will_include_return_nil_message
    tree = BinarySearchTree.new
    refute tree.include?(30),false
    refute tree.include?(30),false
    assert_equal tree.include?(30),nil
  end

  def test_is_include_with_values_right
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(45, "Whatever")
    tree.insert(16, "Bill & Ted's Excellent Adventure")
    assert_equal tree.include?(16),true
    refute tree.include?(55),true
    assert_equal tree.include?(61),true
    assert_equal tree.include?(44),false
  end

  def test_depth_of
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(45, "Whatever")
    tree.insert(16, "Waterworld")
    assert_equal tree.depth_of(16),2
    assert_equal tree.depth_of(66),nil
  end
end

  def test_does_max_return_highest_value
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Waterworld")
    assert_equal tree.max(@head),{"Bill & Ted's Excellent Adventure"=>61}
  end

  def test_does_min_return_lowest_value
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Waterworld")
    assert_equal tree.min(tree.head),{"Waterworld"=>16}
  end

#   def test_sort
#     tree = BinarySearchTree.new
#     tree.insert(61, "Bill & Ted's Excellent Adventure")
#     tree.insert(16, "Waterworld")
#     assert_equal tree.sort(@head),[{"Waterworld"=>16}, {"Bill & Ted's Excellent Adventure"=>61}]
#   end
#
#
# def test_health
#   tree = BinarySearchTree.new
#     tree.insert(61, "Bill & Ted's Excellent Adventure")
#     tree.insert(16, "Waterworld")
#     assert_equal tree.health(61),[[61,1,100]]
#   end
#
#   def test_if_movie_file_returns_length_of_file
#   end
