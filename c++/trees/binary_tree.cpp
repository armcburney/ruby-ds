#include "binary_tree.hpp"

BinaryTree::BinaryTree( NodePtr root ) : root(root) {
  if (root)
    std::cout << "New binary tree created with root value: " << root->getData() << std::endl;
}

// Returns the root node for the binary tree
NodePtr BinaryTree::getRoot() {
  return this->root;
}

// Inserts a node into the tree by calling overloaded method
void BinaryTree::insertNode( NodePtr node ) {
  insertNode(node, this->getRoot());
}

// Inserts a node into the tree in O(log(n)) time
void BinaryTree::insertNode( NodePtr node, NodePtr curr ) {
  if ( curr == nullptr ) {
    // Base case 1: insert a node at root
    root = node;
  } else if ( curr->getLeft() == nullptr && node->getData() <= curr->getData() ) {
    // Base case 2: insert a node left
    node->setParent(curr);
    curr->setLeft(node);
  } else if ( curr->getRight() == nullptr && node->getData() > curr->getData() ) {
    // Base case 3: insert a node right
    node->setParent(curr);
    curr->setRight(node);
  } else if ( node->getData() <= curr->getData() ) {
    // Recurse left
    insertNode(node, curr->getLeft());
  } else {
    // Recurse right
    insertNode(node, curr->getRight());
  }
}

// Finds a node in the tree by calling overloaded method
NodePtr BinaryTree::findNode( int data ) {
  return findNode(data, this->getRoot());
}

// Finds a node into the tree in O(log(n)) time
NodePtr BinaryTree::findNode( int data, NodePtr curr ) {
  if ( curr == nullptr || data == curr->getData() ) {
    return curr;
  } else if ( data <= curr->getData() ) {
    return findNode(data, curr->getLeft());
  } else {
    return findNode(data, curr->getRight());
  }
}

// Deletes a node from a tree in O(log(n)) time (does not delete the node)
void BinaryTree::deleteNode( int data ) {}
