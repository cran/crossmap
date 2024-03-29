% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cross_fit_glm.R
\name{cross_fit_glm}
\alias{cross_fit_glm}
\title{Cross fit generalized linear models}
\usage{
cross_fit_glm(
  data,
  formulas,
  cols = NULL,
  weights = NULL,
  families = gaussian(link = identity),
  fn_args = list(),
  tidy = tidy_glance,
  tidy_args = list(),
  errors = c("stop", "warn")
)
}
\arguments{
\item{data}{A data frame}

\item{formulas}{A list of formulas to apply to each subset of the data.
If named, these names will be used in the \code{model} column of the output.
Otherwise, the formulas will be converted to strings in the \code{model} column.}

\item{cols}{Columns to subset the data.
Can be any expression supported by
<\code{\link[dplyr:dplyr_tidy_select]{tidy-select}}>.
If \code{\link{NULL}}, the data is not subset into columns.
Defaults to \code{NULL}.}

\item{weights}{A list of columns passed to \code{weights} in \code{fn}.
If one of the elements is \code{\link{NULL}} or \code{\link{NA}}, that model will not
be weighted.
Defaults to \code{NULL}.}

\item{families}{A list of \link{glm} model families.
Defaults to \code{\link[=gaussian]{gaussian("identity")}}, the equivalent of \code{\link[=lm]{lm()}}.
See \link{family} for examples.}

\item{fn_args}{A list of additional arguments to \code{\link[=glm]{glm()}}.}

\item{tidy}{A logical or function to use to tidy model output into
data.frame columns.
If \code{TRUE}, uses the default tidying function: \code{\link[=tidy_glance]{tidy_glance()}}.
If \code{FALSE}, \code{NA}, or \code{NULL}, the untidied model output will be returned in
a list column named \code{fit}.
An alternative function can be specified with an unquoted function name or
a \link[purrr:map]{purrr}-style lambda function with one argument (see usage
with \link[broom:tidy.lm]{broom::tidy(conf.int = TRUE)} in examples).
Defaults to \link{tidy_glance}.}

\item{tidy_args}{A list of additional arguments to the \code{tidy} function}

\item{errors}{If \code{"stop"}, the default, the function will stop and return an
error if any subset produces an error.
If \code{"warn"}, the function will produce a warning for subsets that produce
an error and return results for all subsets that do not.}
}
\value{
A tibble with a column for the model formula,
columns for subsets,
columns for the model family and type,
columns for the weights (if applicable),
and columns of tidy model output or a list column of models
(if \code{tidy = FALSE})
}
\description{
Cross fit generalized linear models
}
\examples{
cross_fit_glm(
  data     = mtcars,
  formulas = list(am ~ gear, am ~ cyl),
  cols     = vs,
  families = list(gaussian("identity"), binomial("logit"))
)
}
\seealso{
\code{\link[=cross_fit]{cross_fit()}} to use any modeling function.
}
