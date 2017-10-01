#ifndef EDGE_H
#define EDGE_H

#include "vertex.hpp"

/**
 * Edge.hpp
 * Weighted edge representation
 */
class Edge {

public:
  Edge( int, VertexPtr, VertexPtr );

  // Accessors
  int getWeight() const;

  // Mutators
  void setWeight( int );

private:
  int weight;
  VertexPtr v1, v2;

};

typedef std::shared_ptr<Edge> EdgePtr;

#endif // EDGE_H
