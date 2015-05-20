\name{SubpathwayGMir-internal}
\alias{getEdgeLabel}
\alias{getEdgeLty}
\alias{getLayout}
\alias{fdr.est}
\alias{getOneNodePath}
\alias{mytriangle}
\alias{getSymbolFromGene}
\alias{k2ri}
\title{SubpathwayGMir internal functions}
\description{
  These are functions internally called by other functions in package and not meant to be called by the user.
}

\usage{
getEdgeLabel(graph)
getEdgeLty(graph)
getLayout(graph)
fdr.est(p)
getOneNodePath(current_node,other_nodes,pathway,
         n,all_shortest_paths_length,
         directed,method="shortestPaths")
mytriangle(coords, v=NULL, params)
getSymbolFromGene(geneList)
}

\author{  Li Feng, Chunquan Li and Xia Li}
\keyword{internal}
