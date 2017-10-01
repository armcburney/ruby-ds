/**
 * Kruskal.cpp
 * Coded by: Andrew McBurney
 *
 * If the vertices of an edge are in different disjoint sets, add the edge to
 * the set of edges
 */

// Undirected graph representation (edges are pair of adjacent vertices)
struct Graph {
  vector<VertexPtr> verticies;
  std::vector<Edge> edges;
};
