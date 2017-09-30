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

  // Insert a node in O(log(n))
  void insertNode( NodePtr );
  void insertNode( NodePtr, NodePtr );

  // Insert a delete a node with data in O(log(n))
  void deleteNode( int );

  // Finds a node in O(log(n))
  NodePtr findNode( int );
  NodePtr findNode( int, NodePtr );

private:
  NodePtr root;

};

#endif // BINARY_TREE_H
