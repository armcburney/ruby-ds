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

  // Populate tree with ten arbitrary nodes
  for ( int i = 0; i < 10; i++ ) nodes.push_back(std::make_shared<Node>(rand() % 1000 + 1));
  for ( auto node : nodes ) bt.insertNode(node);

  std::cout << "Pre order traversal." << std::endl;
  BinaryTreeHelper::preOrderTraversal(bt.getRoot());

  std::cout << "Post order traversal." << std::endl;
  BinaryTreeHelper::postOrderTraversal(bt.getRoot());
  return 0;
}
