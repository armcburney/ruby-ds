//
// Class representing a binary tree made up of 'Nodes'
// Written by: Andrew Robert McBurney
//

#ifndef BINARY_TREE_H
#define BINARY_TREE_H

#include "node.hpp"
#include <memory>

class BinaryTree {

public:
  BinaryTree( NodePtr );
  NodePtr getRoot();
  NodePtr findNode( int );
  void insertNode( NodePtr );
  void deleteNode( int );

private:
  NodePtr findNode( int, NodePtr );
  NodePtr findMinNode( NodePtr );
  void setRoot( NodePtr );
  void insertNode( NodePtr, NodePtr );
  void swapParentChildNode( NodePtr, NodePtr, NodePtr );

  NodePtr root;

};

#endif // BINARY_TREE_H
