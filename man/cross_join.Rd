% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cross_join.R
\name{cross_join}
\alias{cross_join}
\title{Crossing join}
\usage{
cross_join(..., copy = FALSE)
}
\arguments{
\item{...}{\link[=data.frame]{Data frames} or a \link{list} of data frames -- including
data frame extensions (e.g. \link[tibble:tibble]{tibbles}) and lazy data
frames (e.g. from dbplyr or dtplyr).
\code{\link{NULL}} inputs are silently ignored.}

\item{copy}{If inputs are not from the same data source, and copy is
\code{TRUE}, then they will be copied into the same src as the first input.
This allows you to join tables across srcs, but it is a potentially
expensive operation so you must opt into it.}
}
\value{
An object of the same type as the first input.
The order of the rows and columns of the first input is preserved as much
as possible. The output has the following properties:
\itemize{
\item Rows from each input will be duplicated.
\item Output columns include all columns from each input.
If columns have the same name, suffixes are added to disambiguate.
\item Groups are taken from the first input.
}
}
\description{
Adds columns from a set of data frames, creating all combinations of
their rows
}
\examples{
fruits <- dplyr::tibble(
  fruit = c("apple", "banana", "cantaloupe"),
  color = c("red", "yellow", "orange")
)

desserts <- dplyr::tibble(
  dessert = c("cupcake", "muffin", "streudel"),
  makes   = c(8, 6, 1)
)

cross_join(fruits, desserts)
cross_join(list(fruits, desserts))
cross_join(rep(list(fruits), 3))
}
\seealso{
\code{\link[=cross_list]{cross_list()}} to find combinations of elements of vectors
and lists.
}
