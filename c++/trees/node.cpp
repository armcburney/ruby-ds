#include "node.hpp"

Node::Node( int data ) : data(data), left(nullptr), right(nullptr), parent(nullptr) {
  std::cout << "New node created with value: " << data << std::endl;
}

NodePtr Node::getLeft() {
  return left;
}

NodePtr Node::getRight() {
  return right;
}

NodePtr Node::getParent() {
  return parent;
}

int Node::getData() const {
  return data;
}

void Node::setLeft( NodePtr node ) {
  left = node;
}

void Node::setRight( NodePtr node ) {
  right = node;
}

void Node::setParent( NodePtr node ) {
  parent = node;
}

std::ostream& operator<<( std::ostream& stream, const NodePtr& node ) {
  stream << node->getData();
  return stream;
}
