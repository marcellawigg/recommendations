require './node.rb'
require 'minitest/autorun'
require 'minitest/pride'

class NodeTest < Minitest::Test

def test_insert_works
  tree = Node.new(61,"Bill & Ted's Excelletn Adventure")
  assert_equal tree.insert(61, "Bill & Ted's Excellent Adventure"),0
end

end
end
