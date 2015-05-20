\name{identifyGraph}
\alias{identifyGraph}
\title{Annotate and identify subpathways}
\description{
Annotate user-interested molecules to pathways and identify significantly enriched subpathways.
}
\usage{
  identifyGraph(moleculeList,graphList,type="gene_miRNA",
             background=getBackground(type),
             order="pvalue",decreasing=FALSE)
}
\arguments{
  \item{moleculeList}{A character vector. Such as differentially expressed miRNAs and/or genes under disease phenotypes.}
  \item{graphList}{A graph list. There nodes must be represented by genes or miRNAs and genes.} 
  \item{type}{A character string. Should be one of "gene", "miRNA" or "gene_miRNA".}   
  \item{background}{A character vector of molecules.}
  \item{order}{A character string. Should be one of "pvalue", "fdr".}
  \item{decreasing}{A logical. Should the sort be ordered by increasing or decreasing?}
}
\details{

The function can support the annotation and identification of metabolic subpathways based on genes, miRNAs or gene_miRNAs sets. The argument \code{moleculeList} supports three kinds of molecular sets: "genes", "miRNAs" or "gene_miRNAs". 

The argument \code{type} represent the type of input molecules, including one of "genes", "miRNAs" or "gene_miRNA". 

Detailed \code{background} information is provided in the function \code{\link{getBackground}}.

When many correlated subpathways are considered, the parameter \code{order} is used to order the pathways on the basis of "pvalue" or "fdr". 

The parameter \code{decreasing} is set TRUE that represent the order would be performed by decreasing.

}

\value{
A list. It include: 'pathwayId', 'pathwayName', 'annMoleculeList', 'annMoleculeNumber', 'annBgMoleculeList', 'annBgNumber', 'MoleculeNumber', 'bgNumber', 'pvalue', and 'fdr',  corresponding to pathway identifier, pathway name, the submitted molecules annotated to a pathway, the number of submitted molecules annotated to a pathway, the background molecules annotated to a pathway, the number of background molecules annotated to a pathway, the number of submitted molecules, the number of background molecules, p-value of the hypergeometric test, and Benjamini-Hochberg fdr values.

The background molecules annotated to a pathway are equal to all molecules in the pathway. For example, if the submitted molecules are human genes, the background molecules annotated to a pathway are equal to all human genes in the pathway.

The number of background molecules is the number of all molecules. For example, if the submitted molecules are human genes, the number of background molecules is equal to all human genes.

To visualize and save the results, the \code{list} can be converted to the \code{data.frame} by the function \code{\link{printGraph}}. 

Note that \code{moleculeList} must be a 'character' vector. The genes must be represented by NCBI gene ids, and miRNAs must be represented by mature miRNA name in miRBase.
}
\author{ Li Feng, Chunquan Li and Xia Li}
\seealso{\code{\link{printGraph}}, \code{\link{getBackground}}, \code{\link{GetK2riData}}}

\examples{
\dontrun{

###    Annotate and identify subpathways   ###

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
# annotate and identify subpathways.
 ann <- identifyGraph(moleculeList,subGraphList,type="gene_miRNA")
# convert ann to a data frame.
 result <- printGraph(ann,detail=TRUE)

## get undirect KEGG metabolic pathway graphs ##
 graphList <- GetK2riData(K2riData="MetabolicGEGEUEMGraph")
# get reconstructed pathway graph list.
 InteGraphList <- getInteGraphList(graphList, relations) 
# get locate subpathways.
 subGraphList <- getLocSubGraph(moleculeList,InteGraphList,
                 type="gene_miRNA",n=1,s=10)
# annotate and identify subpathways.
 ann <- identifyGraph(moleculeList,subGraphList,type="gene_miRNA")
 result <- printGraph(ann,detail=TRUE)

# save the result.
 write.table(head(result),"result.txt",sep="\t",col.names=TRUE,row.names=FALSE)
}
}
\keyword{ file }

