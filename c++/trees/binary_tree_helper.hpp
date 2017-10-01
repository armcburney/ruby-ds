//
// Namespace with methods for performing operations on a  binary tree
// Written by: Andrew Robert McBurney
//

#ifndef BINARYTREEHELPER_H
#define BINARYTREEHELPER_H

#include "node.hpp"
#include "binary_tree.hpp"

/**
 * BinaryTreeHelper.hpp
 */
namespace BinaryTreeHelper {

  void preOrderTraversal( NodePtr );
  void postOrderTraversal( NodePtr );
  void inOrderTraversal( NodePtr );
  int height( NodePtr );

};

#endif // BINARYTREEHELPER_H
