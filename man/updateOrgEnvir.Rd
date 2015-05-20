\name{updateOrgEnvir}
\alias{updateOrgEnvir}
\title{
Update the organism-specific environment variables
}
\description{
Update the organism-specific environment variables that user interested.
}
\usage{
updateOrgEnvir(org = "hsa", path = "http://rest.kegg.jp", verbose = TRUE)
}
\arguments{
  \item{org}{A character string. It supports six species and must be the abbreviation of a genome name, such as cel(caenorhabditis elegans), dme(drosophila melanogaster), dre(danio rerio), hsa(homo sapiens), mmu(mus musculus) and rno(rattus norvegicus).}
  \item{path}{A character string. The reference path for downloading organism-specific data.}
  \item{verbose}{A logical. If TRUE, the additional diagnostics are printed.}
}
\details{
This package supports to identify metabolic subpathways among six organisms. We only need to update the organism-specific environment variables before subpathway identification. The six organisms contain cel(caenorhabditis elegans), dme(drosophila melanogaster), dre(danio rerio), hsa(homo sapiens), mmu(mus musculus) and rno(rattus norvegicus). The defalut value of the argument \code{org} is "hsa" (human). 
}

\author{ Li Feng, Chunquan Li and Xia Li}
\examples{
\dontrun{

## update organism and the type of gene identifiers ##
 
 updateOrgEnvir("mmu")
 
# show the current environment variables
 ls(k2ri)

# show the background of miRNAs
 k2ri$BGMiRNA[1:3]
}
}
\keyword{ file }