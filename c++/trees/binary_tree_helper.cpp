#include "binary_tree_helper.hpp"

void BinaryTreeHelper::preOrderTraversal( NodePtr curr ) {
  if ( curr != nullptr ) std::cout << curr->getData() << std::endl;        // Visit root
  if ( curr->getLeft() != nullptr )  preOrderTraversal(curr->getLeft());   // Visit left subtree
  if ( curr->getRight() != nullptr ) preOrderTraversal(curr->getRight());  // Visit right subtree
}

void BinaryTreeHelper::postOrderTraversal( NodePtr curr ) {
  if ( curr->getLeft() != nullptr )  postOrderTraversal(curr->getLeft());  // Visit left subtree
  if ( curr->getRight() != nullptr ) postOrderTraversal(curr->getRight()); // Visit right subtree
  if ( curr != nullptr ) std::cout << curr->getData() << std::endl;        // Visit root
}

void BinaryTreeHelper::inOrderTraversal( NodePtr curr ) {
  if ( curr->getLeft() != nullptr )  inOrderTraversal(curr->getLeft());    // Visit left subtree
  if ( curr != nullptr ) std::cout << curr->getData() << std::endl;        // Visit root
  if ( curr->getRight() != nullptr ) inOrderTraversal(curr->getRight());   // Visit right subtree
}

int BinaryTreeHelper::height( NodePtr curr ) {
  return 0;
}
