#include "graph_helpers.hpp"
#include <queue>

/**
 * dfs.cpp
 * Coded by: Andrew McBurney
 */

// Recursive DFS helper function
void GraphHelpers::DFS_visit( VertexPtr v, int time ) {
  v->setColor(gray);
  time ++;

  for ( auto &w : v->getAdjacent() ) {
    if ( w->getColor() != white ) continue;
    w->setParent(v);
    DFS_visit(w, time);
  }

  v->setColor(black);
  time ++;
}

// Performs DFS on a unidirected graph, given a starting vertex in the Graph
void GraphHelpers::DFS( Graph G ) {
  std::for_each(std::begin(G.getVertices()), std::end(G.getVertices()), [&](VertexPtr v) {
    v->setColor(white);
    v->setParent(nullptr);
  });

  int time = 0;

  std::for_each(std::begin(G.getVertices()), std::end(G.getVertices()), [time](VertexPtr v) {
    if ( v->getColor() == white ) DFS_visit(v, time);
  });
}

/**
 * bfs.cpp
 * Coded by: Andrew McBurney
 *
 * A breadth-first search of an undirected graph begins at a specified vertex s.
 * The search “spreads out” from s, proceeding in layers.
 *
 * First, all the neighbours of s are explored.
 * Next, the neighbours of those neighbours are explored.
 * This process continues until all vertices have been explored.
 * A queue is used to keep track of the vertices to be explored.
 */

// Performs BFS on a unidirected graph, given a starting vertex in the Graph
void BFS( Graph G, VertexPtr s ) {
  // Queue of vertices to be visited
  std::queue<VertexPtr> Q;

  // Initialize the graph vertices
  for ( auto &v : G.getVertices() ) {
    v->setColor(white);
    v->setParent(nullptr);
  }

  // Visit the starting node
  s->setColor(gray);
  Q.push(s);

  while ( !Q.empty() ) {
    VertexPtr u = Q.front();
    Q.pop();

    // 'Spread out' to all the adjacent neighbours
    for ( auto &v : u->getAdjacent() ) {
      /**
       * If the vertex is not visited yet (ie. white), add it to the queue of
       * vertices to be visited at a later time
       */
      if ( v->getColor() != white ) continue;
      v->setColor(gray);
      v->setParent(u);
      Q.push(v);
    }

    // Finished visiting vertex
    u->setColor(black);
  }
}
