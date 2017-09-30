//
// main.cpp for calling tree code
// Written by: Andrew Robert McBurney
//

#include <memory>
#include "node.hpp"
#include "binary_tree.hpp"
#include "binary_tree_helper.hpp"

int main( void ) {
  BinaryTree bt( nullptr );

  for ( auto node : { std::make_shared<Node>(1), std::make_shared<Node>(2), std::make_shared<Node>(3) }) {
    bt.insertNode(node);
  }

  BinaryTreeHelper::preOrderTraversal(bt.getRoot());
  return 0;
}
