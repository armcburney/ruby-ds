CXX = g++
CXXFLAGS = -g -Wall -MMD -std=c++1z
MAKEFILE_NAME = ${firstword ${MAKEFILE_LIST}}

OBJECTS01 = trees/main.cpp trees/binary_tree_helper.o trees/node.o trees/binary_tree.o
EXEC01 = trees/trees

OBJECTS = ${OBJECTS1}
DEPENDS = ${OBJECTS:.o=.d}
EXECS = ${EXEC1}

#############################################################

.PHONY : all clean

all : ${EXECS}

${EXEC01} : ${OBJECTS01}
	g++ ${CXXFLAGS} $^ -o $@

#############################################################

${OBJECTS} : ${MAKEFILE_NAME}

-include ${DEPENDS}

clean :
	rm -f trees/*.d trees/*.o ${EXECS}
