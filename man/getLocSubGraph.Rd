\name{getLocSubGraph}
\alias{getLocSubGraph}
\title{Get the located metabolic subpathways
}
\description{
Locate metabolic subpathways mediated by miRNAs.
}
\usage{
getLocSubGraph(moleculeList, graphList, type="gene_miRNA", 
   n=1, s=10, method = "shortestPaths")
}
\arguments{
  \item{moleculeList}{A character vector. Such as differentially expressed miRNAs and/or genes under disease phenotypes.}
  \item{graphList}{A graph list. There nodes must be represented by genes. } 
  \item{type}{A character string. Should be one of "gene", "miRNA" or "gene_miRNA".}
  \item{n}{An integer. The maximum acceptable quantities of non-signature node at the shortest path between each two differential molecules.}  
  \item{s}{An integer. The minimum acceptable quantities of nodes in located subpathways.}  
  \item{method}{A character string. In which the shorest path algorithms will be used. See the function \code{\link{get.shortest.paths}}.} 
}
\details{
We apply lenient distance similarity method to locate metabolic subpathways mediated by miRNAs. We first map user interested differentially expressed miRNAs and/or genes to pathways as signatures. For a given pathway, we compute the shortest path between any two signatures. In shortest path, if the number of non-signature nodes between two signatures is no more than n, then these two signature nodes and other nodes at the shortest path are added into the same node set. We extract the corresponding subgraph in the pathway graph according to each node set. We finally define these subgraphs with node number >= s as the subpathway regions of the pathway. 
The argument \code{n} is maximum number of permitted non-signature nodes at the shortest path between signature nodes. The default parameter n=1.
The argument \code{s} is used to filter subpathways in which the number of nodes are less than the parameter s. The default parameter s=10.
The argument \code{method} determines which shortest path algorithms will be used. We set the default value as "get.shortest.paths". 
}
\value{ A list of graphs.}
\author{ Li Feng, Chunquan Li and Xia Li}
\seealso{ \code{\link{identifyGraph}}, \code{\link{get.shortest.paths}}}

\examples{
\dontrun{

### Integrate miRNAs to KEGG pathway graphs ###

## get hsa-specificd miRNA-target interactions ##
 expMir2Tar <- GetK2riData(K2riData="expMir2Tar")
 row1 <- which(expMir2Tar[["LowTHExps"]]=="YES")
 row2 <- which(expMir2Tar[["Species"]]=="hsa")
 relations <- unique(expMir2Tar[intersect(row1,row2),c(2:3)])

# get user-interested miRNAs and genes sets.
 moleculeList <- c(getBackground(type="gene")[1:1000],
                 getBackground(type="miRNA")[1:2000])

## get direct KEGG metabolic pathway graphs ##
 graphList <- GetK2riData(K2riData="MetabolicGEGEEMGraph")
# get reconstructed pathway graph list.
 InteGraphList <- getInteGraphList(graphList, relations) 
# get locate subpathways.
 subGraphList <- getLocSubGraph(moleculeList,InteGraphList,
                 type="gene_miRNA",n=1,s=10)
# visualize the located subpathways.
 plotGraph(subGraphList[[1]],layout=layout.random)


## get undirect KEGG metabolic pathway graphs ##
 graphList <- GetK2riData(K2riData="MetabolicGEGEUEMGraph")
# get reconstructed pathway graph list.
 InteGraphList <- getInteGraphList(graphList, relations) 
# get locate subpathways.
 subGraphList <- getLocSubGraph(moleculeList,InteGraphList,
                 type="gene_miRNA",n=1,s=10)
# visualize the located subpathways.
 plotGraph(subGraphList[[1]],layout=layout.random)
}
}
\keyword{ file }

