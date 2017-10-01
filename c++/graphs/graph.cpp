#include "graph.hpp"

#include <iostream>

Graph::Graph( std::vector<VertexPtr> v, std::vector<EdgePtr> e ) : vertices(v), edges(e) {
  std::cout << "New graph created." << std::endl;
}

std::vector<VertexPtr> Graph::getVertices() const {
  return vertices;
}

std::vector<EdgePtr> Graph::getEdges() const {
  return edges;
}
