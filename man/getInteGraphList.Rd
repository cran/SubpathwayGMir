\name{getInteGraphList}
\alias{getInteGraphList}
\title{Get the reconstructed metabolic pathway graphs}
\description{
 Get the reconstructed KEGG metabolic pathway graphs embedded by miRNAs through integrating experimentally verified miRNA-target interactions.
}
\usage{
getInteGraphList(graphList,relations)
}
\arguments{
  \item{graphList}{A graphList. There nodes must be represented by genes.}
  \item{relations}{A data frame. It contains two columns, the first is miRNA names and the second is its target names.}
}
\details{
The argument "relations" represents user-interested miRNA-target interactions, which can be returned from the \code{GetK2riData}.
 }
\value{
A graph list. 
}
\author{ Li Feng, Chunquan Li and Xia Li}
\seealso{ \code{\link{plotGraph}}, \code{\link{getLocSubGraph}}, \code{\link{GetK2riData}}}
\examples{
\dontrun{

### Integrate miRNAs into KEGG pathway graphs ###

## get hsa-specificd miRNA-target interactions ##
 expMir2Tar <- GetK2riData(K2riData="expMir2Tar")
 row1 <- which(expMir2Tar[["LowTHExps"]]=="YES")
 row2 <- which(expMir2Tar[["Species"]]=="hsa")
 relations <- unique(expMir2Tar[intersect(row1,row2),c(2:3)])

## get direct KEGG metabolic pathway graphs ## 
 graphList <- GetK2riData(K2riData="MetabolicGEGEEMGraph")
# get reconstructed pathway graph list #
 InteGraphList <- getInteGraphList(graphList, relations) 
# visualize the reconstructed pathways #
 plotGraph(InteGraphList[[1]],layout=layout.random)

## get undirect KEGG metabolic pathway graphs ##
 graphList <- GetK2riData(K2riData="MetabolicGEGEUEMGraph")
# get reconstructed pathway graph list #
 InteGraphList <- getInteGraphList(graphList, relations) 
# visualize the reconstructed pathways #
 plotGraph(InteGraphList[[1]],layout=layout.random)
 }
}
\keyword{ file }