//
// main.cpp for calling tree code
// Written by: Andrew Robert McBurney
//

#include "node.hpp"
#include "binary_tree.hpp"
#include "binary_tree_helper.hpp"

#include <memory>
#include <vector>

int main( void ) {
  BinaryTree bt( nullptr );
  std::vector<NodePtr> nodes;

  for ( int i = 1; i <= 10; i++ ) nodes.push_back(std::make_shared<Node>(i));
  for ( auto node : nodes ) bt.insertNode(node);

  bt.deleteNode(1);

  std::cout << "Pre order traversal." << std::endl;
  BinaryTreeHelper::preOrderTraversal(bt.getRoot());
  return 0;
}
