\name{printGraph}
\alias{printGraph}
\title{Print the results of graph annotation and identification}
\description{
  Print the results of graph annotation and identification.
}
\usage{
     printGraph(ann,detail=FALSE)
}
\arguments{
  \item{ann}{ A list. The value was returned from the function \code{\link{identifyGraph}}.}
  \item{detail}{ A logical. If true, gene lists from the function \code{\link{identifyGraph}} are converted into strings, which are used to display and write results with genes. }
}
\value{
A data.frame. Columns include pathwayId, pathwayName, annMoleculeRatio, annBgRatio, pvalue, 'fdr', annMoleculeList, annBgMoleculeList. Detailed information is provided in \code{\link{identifyGraph}}.
}
\author{ Li Feng, Chunquan Li and Xia Li}
\seealso{\code{\link{identifyGraph}}}

\examples{
\dontrun{

# get hsa-specificd miRNA-target interactions 
 expMir2Tar <- GetK2riData(K2riData="expMir2Tar")
 row1 <- which(expMir2Tar[["LowTHExps"]]=="YES")
 row2 <- which(expMir2Tar[["Species"]]=="hsa")
 relations <- unique(expMir2Tar[intersect(row1,row2),c(2:3)])

# get direct KEGG metabolic pathway graphs 
 graphList <- GetK2riData(K2riData="MetabolicGEGEEMGraph")

# get reconstructed pathway graph list.
 InteGraphList <- getInteGraphList(graphList, relations) 

# get user-interested miRNAs and genes sets.
 moleculeList <- c(getBackground(type="gene")[1:1000],
                  getBackground(type="miRNA")[1:2000])
				  
# get locate subpathways.
 subGraphList <- getLocSubGraph(moleculeList,InteGraphList,
                 type="gene_miRNA",n=1,s=10)
				 
# annotate and identify subpathways.
 ann <- identifyGraph(moleculeList,subGraphList,type="gene_miRNA")

# convert ann to a data frame.
 result <- printGraph(ann,detail=TRUE)

# save the result.
 write.table(head(result),"result.txt",sep="\t",col.names=TRUE,row.names=FALSE)

}
}
\keyword{ file }

