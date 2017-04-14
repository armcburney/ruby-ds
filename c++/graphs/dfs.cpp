/**
 * dfs.cpp
 * Coded by: Andrew McBurney
 */

#include <stack>
#include <string>
#include <vector>

// Pointer to parent of vertex in graph
#define VertexPtr shared_ptr<Vertex>

using namespace std;

// Color enumeration
enum Color { white, gray, black };

// Graph Vertex representation (edges between adjacent verticies)
struct Vertex {
  Color color;
  VertexPtr parent;
  vector<VertexPtr> adjacent;
};

// Undirected graph representation (edges are pair of adjacent vertices)
struct Graph {
  vector<VertexPtr> verticies;
};

/**
 * Recursive DFS helper function
 */
void DFS_visit(VertexPtr v, int time) {
  v->color = gray;
  time ++;

  for (auto &w : v->adjacent) {
    if (w->color == white) {
      w->parent = v;
      DFS_visit(w, time);
    }
  }

  v->color = black;
  time ++;
}

/**
 * Performs DFS on a unidirected graph, given a starting vertex in the Graph
 */
void DFS(Graph G) {
  for (auto &v : G.verticies) {
    v->color = white;
    v->parent = nullptr;
  }

  int time = 0;

  for (auto &v : G.verticies)
    if (v->color == white) DFS_visit(v, time);
}
