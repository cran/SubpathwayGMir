\name{initializeK2ri}
\alias{initializeK2ri}
\title{Initialize environment variable k2ri}
\description{
Initialize environment variable k2ri.
}
\usage{
initializeK2ri()
}
\details{
We can use the \code{\link{initializeK2ri}} to initialize the environment variable k2ri in current environment. The environment variable k2ri contains many informations. We can use the function \code{\link{ls}} to see all variables and use \code{ls(k2ri)} to see all informations in current environment, which include \code{BGGene}, \code{BGMiRNA}, \code{expMir2Tar}, \code{gene2path}, \code{gene2symbol}, \code{miRNA2Org}, \code{MetabolicGEGEUEMGraph}, and \code{MetabolicGEGEEMGraph}. We can use the function \code{\link{get}} to obtain one of them.  
}
\author{ Li Feng, Chunquan Li and Xia Li}
\examples{
\dontrun{
# initialize environment k2ri.
 initializeK2ri()
  
# see whether k2ri is exist in R or not.
 ls()

# see all environment variable contained in k2ri.
 ls(k2ri)
 }
}
\keyword{ file }

