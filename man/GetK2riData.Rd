\name{GetK2riData}
\alias{GetK2riData}
\title{
Get the environment data
}
\description{
Get variables in current environment.
}
\usage{
GetK2riData(K2riData)
}
\arguments{
  \item{K2riData}{
  A character string. It must be one of them, including "expMir2Tar", "miRNA2Org", "BGMiRNA", "BGGene", "gene2symbol", "gene2path", "MetabolicGEGEUEMGraph" and "MetabolicGEGEEMGraph".
 }
}
\details{
 The parameter K2riData is "expMir2Tar", which represents to obtain all miRNA-target interactions verified by experiments.
 
 The parameter K2riData is "miRNA2Org", which represents to obtain miRNA-organism data.
 
 The parameter K2riData is "BGMiRNA", which represents to obtain miRNA background data.
 
 The parameter K2riData is "BGGene", which represents to obtain gene backgound data.
 
 The parameter K2riData is "gene2symbol", which represents to obtain gene-symbol data.
 
 The parameter K2riData is "gene2path", which represents to obtain gene-pathway data.
 
 The parameter K2riData is "MetabolicGEGEUEMGraph", which represents to obtain undirect KEGG metabolic pathway graphs with genes as nodes.
 
 The parameter K2riData is "MetabolicGEGEEMGraph", which represents to obtain direct KEGG metabolic pathway graphs with genes as nodes.
}

\author{ Li Feng, Chunquan Li and Xia Li}
\seealso{\code{\link{updateOrgEnvir}}}

\examples{
\dontrun{

# obtain all miRNA-target interactions #
expMir2Tar <- GetK2riData(K2riData="expMir2Tar")
expMir2Tar[1:6,]

# obtain miRNA background #
BGMiRNA <- GetK2riData(K2riData="BGMiRNA")
BGMiRNA[1:10]

}
}
\keyword{ file }
