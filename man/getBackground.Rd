\name{getBackground}
\alias{getBackground}
\title{
Get the background of molecules
}
\description{
getBackground attempts to get the background of user-specified molecules.
}
\usage{
getBackground(type = "gene_miRNA")
}
\arguments{
  \item{type}{
A character string. Should be one of "gene", "miRNA" or "gene_miRNA".}
}
\details{
The default background is obtained from the environment variable. For human, the reference gene background is all human genes in KEGG pathways. The reference miRNA background is collected from miRBase database. 
}
\value{
A character vector. 
}

\author{
Li Feng, Chunquan Li and Xia Li
}

\seealso{\code{\link{identifyGraph}}}
\examples{
\dontrun{
## get all background of genes
 bgGene <- getBackground(type="gene")

## get all background of miRNAs
 bgMir  <- getBackground(type="miRNA")

## get all background of miRNAs and genes
 bgGMir <- getBackground(type="gene_miRNA")
}
}
\keyword{file}
