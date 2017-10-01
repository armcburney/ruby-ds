#ifndef GRAPH_HELPERS_H
#define GRAPH_HELPERS_H

#include "graph.hpp"
#include "vertex.hpp"

/**
 * graph_helpers.hpp
 */
namespace GraphHelpers {

  void BFS( Graph G, VertexPtr s );
  void DFS( Graph G );
  void DFS_visit( VertexPtr v, int time );
  void kruskal( Graph G );

}

#endif // GRAPH_HELPERS_H
