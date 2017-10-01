#include "binary_tree.hpp"
#include <memory>

BinaryTree::BinaryTree( NodePtr root ) : root(root) {
  if ( root ) {
    std::cout << "New binary tree created with root value: " << root->getData() << std::endl;
  }
}

// Returns the root node for the binary tree
NodePtr BinaryTree::getRoot() {
  return root;
}

// Sets the root to a new NodePtr
void BinaryTree::setRoot( NodePtr node ) {
  root = node;
}

// Inserts a node into the tree by calling overloaded method
void BinaryTree::insertNode( NodePtr node ) {
  insertNode(node, getRoot());
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
  } else if ( node->getData() > curr->getData() ) {
    // Recurse right
    insertNode(node, curr->getRight());
  }
}

// Deletes a node from a tree in O(log(n)) time (does not delete the node)
void BinaryTree::deleteNode( int data ) {
  NodePtr node   = findNode(data);
  NodePtr parent = node->getParent();

  if ( node->getLeft() == nullptr && node->getRight() == nullptr ) {
    swapParentChildNode(parent->getLeft(), node, nullptr);
  } else if ( node->getLeft() == nullptr && node->getRight() != nullptr ) {
    ( parent == nullptr ) ? setRoot(node->getRight()) : parent->setRight(node->getRight());
    node->getRight()->setParent(parent);
  } else if ( node->getRight() == nullptr && node->getLeft() != nullptr ) {
    ( parent == nullptr ) ? setRoot(node->getLeft()) : parent->setLeft(node->getLeft());
    node->getLeft()->setParent(parent);
  } else {
    NodePtr minNodeRightSubtree = findMinNode(node->getRight());
    std::swap(node, minNodeRightSubtree);
    swapParentChildNode(node->getParent(), node, nullptr);
  }
}

// Finds a node in the tree by calling overloaded method
NodePtr BinaryTree::findNode( int data ) {
  return findNode(data, getRoot());
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

// Returns the minimum node in a subtree
NodePtr BinaryTree::findMinNode( NodePtr curr ) {
  if ( curr->getLeft() == nullptr ) {
    return curr;
  } else {
    return findMinNode(curr->getLeft());
  }
}

// Swaps a parent's child to some value when only one child exists
void BinaryTree::swapParentChildNode( NodePtr parent, NodePtr child, NodePtr value ) {
  ( parent->getLeft() == child ) ? parent->setLeft(value) : parent->setRight(value);
}
