/**
 * Kruskal.cpp
 * Coded by: Andrew McBurney
 *
 * If the vertices of an edge are in different disjoint sets, add the edge to
 * the set of edges
 */

#include <vector>

// Pointer to parent of vertex in graph
#define VertexPtr shared_ptr<Vertex>

using namespace std;

// Graph Vertex representation (edges between adjacent verticies)
struct Vertex {
  Color color;
  vector<VertexPtr> adjacent;
};

// Weighted edge representation
struct Edge {
  int weight;
  Vertex v1;
  Vertex v2;
};

// Undirected graph representation (edges are pair of adjacent vertices)
struct Graph {
  vector<VertexPtr> verticies;
  std::vector<Edge> edges;
};

/**
 * Perform kruskal's algorithm on a undirected, weighted graph, and returns the
 * set of verticies in the MST it returns
 */
vector<Edge> kruskal(Graph G) {
  vector<Edge> A;

  // Create disjoint sets with verticies
  for (auto v : G.verticies) {
    make_set(v);
  }

  // sort w(e1) < w(e2) < w(e3) < ... < w(em), where m = |V(E)|
  std::sort(G.edges.begin(), G.edges.end(),
            [](Edge u, Edge v) {return u.weight < v.weight});

  for (auto const &edge : G.edges) {
    char root_v1 = find(edge.v1); // find returns root of disjoint set
    char root_v2 = find(edge.v2); // find returns root of disjoint set

    // If they're not in the same disjoint sets
    if (root_v1 != root_v2) {
      A.push_back(edge);
      union(root_v1, root_v2); // union the disjoint sets
    }
  }

  return A;
};
