//
// Class representing a 'Node' with a simple integer key as data
// Written by: Andrew Robert McBurney
//

#ifndef NODE_H
#define NODE_H

#include <iostream>

class Node; // forward declaration

typedef std::shared_ptr<Node> NodePtr;

class Node {

public:
  Node(int);

  // Accessors
  NodePtr getLeft();
  NodePtr getRight();
  NodePtr getParent();
  int getData() const;

  // Mutators
  void setLeft( NodePtr );
  void setRight( NodePtr );
  void setParent( NodePtr );

  friend std::ostream& operator<<( std::ostream&, const NodePtr& );

private:
  int data;
  NodePtr left, right, parent;

};

#endif // NODE_H
