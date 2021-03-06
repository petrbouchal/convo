% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rename.R
\name{rename_convo}
\alias{rename_convo}
\title{Rename computed columns based on controlled vocabulary}
\usage{
rename_convo(vbls, convo)
}
\arguments{
\item{vbls}{Character vector of variable names to transform}

\item{convo}{\code{convo} object with at least one vocabulary item with \code{rename} property}
}
\value{
Character vector of column names renamed per \code{convo} specification
}
\description{
Often when columns are operated on, their former name will no longer correctly indicate their
properties. For example, when binary indicator variables are summed, they become integer count
variables instead.
}
\details{
This function allows users to specify the \code{rename} property in their \code{convo} to
explain how certain variables ought be renamed when transformed. It plays particularly nicely
with the automatic renaming conventions of \code{dplyr} scoped operators, as shown in the second example.
}
\examples{
path <- system.file("", "ex-convo.yml", package = "convo")
convo <- read_convo(path)
vbl_names <- c("IND_A_AVG", "IND_B_SUM")
rename_convo(vbl_names, convo)


\dontrun{
data.frame(
  IND_A = sample(0:1, 10, replace = TRUE),
  IND_B = sample(0:1, 10, replace = TRUE)
  ) \%>\%
    summarize_all(list(SUM = sum, AVG = mean)) \%>\%
    rename_all(~rename_convo(., convo))
}
}
