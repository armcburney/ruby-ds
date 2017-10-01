#include "edge.hpp"

#include <iostream>

Edge::Edge( int weight, VertexPtr v1, VertexPtr v2) : weight(weight), v1(v1), v2(v2) {
  std::cout << "New edge created." << std::endl;
}

int Edge::getWeight() const {
  return weight;
}

void Edge::setWeight( int newWeight ) {
  weight = newWeight;
}
