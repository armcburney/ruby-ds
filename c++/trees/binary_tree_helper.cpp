#include "binary_tree_helper.hpp"

void BinaryTreeHelper::preOrderTraversal( NodePtr curr ) {
  if ( curr != nullptr ) std::cout << curr->getData() << std::endl;

  if ( curr->getLeft() != nullptr ) {
    preOrderTraversal(curr->getLeft());
  } else if ( curr->getRight() != nullptr ) {
    preOrderTraversal(curr->getRight());
  }
}

void BinaryTreeHelper::postOrderTraversal( NodePtr curr ) {
  if ( curr != nullptr ) std::cout << curr << std::endl;
}

void BinaryTreeHelper::inOrderTraversal( NodePtr curr ) {
}
