#include "vertex.hpp"

#include <iostream>

Vertex::Vertex( Color color, VertexPtr parent ) : color(color), parent(parent) {
  std::cout << "New vertex created." << std::endl;
}

Color Vertex::getColor() const {
  return color;
}

VertexPtr Vertex::getParent() const {
  return parent;
}

std::vector<VertexPtr> Vertex::getAdjacent() const {
  return adjacent;
}

void Vertex::setColor( Color newColor ) {
  color = newColor;
}

void Vertex::setParent( VertexPtr newParent ) {
  parent = newParent;
}

void Vertex::setAdjacent( std::vector<VertexPtr> adjList ) {
  adjacent = adjList;
}
