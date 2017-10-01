#ifndef VERTEX_H
#define VERTEX_H

#include <memory>
#include <vector>

// Color enumeration
enum Color { white, gray, black };

class Vertex;
typedef std::shared_ptr<Vertex> VertexPtr;

/**
 * Vertex.hpp
 * Graph Vertex representation (edges between adjacent verticies)
 */
class Vertex {

public:
  Vertex( Color, VertexPtr );

  // Accessors
  Color getColor() const;
  VertexPtr getParent() const;
  std::vector<VertexPtr> getAdjacent() const;

  // Mutators
  void setColor( Color );
  void setParent( VertexPtr );
  void setAdjacent( std::vector<VertexPtr> );

private:
  Color color;
  VertexPtr parent;
  std::vector<VertexPtr> adjacent;

};

#endif // VERTEX_H
