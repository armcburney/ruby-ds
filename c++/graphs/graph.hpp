#ifndef GRAPH_H
#define GRAPH_H

#include "edge.hpp"
#include "vertex.hpp"
#include <vector>

/**
 * graph.hpp
 * Undirected graph representation (edges are pair of adjacent vertices)
 */
class Graph {

public:
  Graph( std::vector<VertexPtr>, std::vector<EdgePtr> );

  std::vector<VertexPtr> getVertices() const;
  std::vector<EdgePtr>   getEdges()    const;

private:
  std::vector<VertexPtr> vertices;
  std::vector<EdgePtr>   edges;

};

#endif // GRAPH_H
