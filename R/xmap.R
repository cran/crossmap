#' Map over each combination of list elements
#'
#' These functions are variants of [purrr::pmap()] that iterate over each
#' combination of elements in a list.
#'
#' Typed variants return a vector of the specified type.
#' To automatically determine type, try [xmap_vec()].
#'
#' To return results as a matrix or array, try [xmap_mat()] and [xmap_arr()].
#'
#' Note that a data frame is a very important special case, in which case
#' `xmap()` and `xwalk()` apply the function `.f` to each row.
#' `xmap_dfr()` and `xmap_dfc()` return data frames created by row-binding and
#' column-binding respectively.
#'
#' @param .l A list of vectors, such as a data frame.
#'   The length of .l determines the number of arguments that .f will be called
#'   with.
#'   List names will be used if present.
#' @param .f A function, formula, or vector (not necessarily atomic).
#'
#'   If a **function**, it is used as is.
#'
#'   If a **formula**, e.g. `~ .x + 2`, it is converted to a function. There
#'   are three ways to refer to the arguments:
#'
#'   * For a single argument function, use `.`
#'   * For a two argument function, use `.x` and `.y`
#'   * For more arguments, use `..1`, `..2`, `..3` etc
#'
#'   This syntax allows you to create very compact anonymous functions.
#'
#'   If **character vector**, **numeric vector**, or **list**, it is
#'   converted to an extractor function. Character vectors index by
#'   name and numeric vectors index by position; use a list to index
#'   by position and name at different levels. If a component is not
#'   present, the value of `.default` will be returned.
#' @param ... Additional arguments passed on to `.f`
#' @param .id Either a string or `NULL`.
#'   If a string, the output will contain a variable with that name, storing
#'   either the name (if `.x` is named) or the index (if `.x` is unnamed) of
#'   the input.
#'   If `NULL`, the default, no variable will be created.
#'
#'   Only applies to `_dfr` variant.
#'
#' @return An atomic vector, list, or data frame, depending on the suffix.
#'   Atomic vectors and lists will be named if the first element of .l is named.
#'
#'   If all input is length 0, the output will be length 0.
#'   If any input is length 1, it will be recycled to the length of the longest.
#'
#' @seealso [xmap_vec()] to automatically determine output type.
#'
#'   [xmap_mat()] and [xmap_arr()] to return results in a matrix or array.
#'
#'   [future_xmap()] to run `xmap` functions with parallel processing.
#'
#'   [cross_fit()] to apply multiple models to multiple subsets of data.
#'
#'   [cross_list()] to find combinations of list elements.
#'
#'   [purrr::map()], [purrr::map2()], and [purrr::pmap()] for other mapping
#'   functions.
#'
#' @export
#'
#' @example examples/xmap.R

xmap <- function(.l, .f, ...) {
  purrr::pmap(cross_list(.l), .f, ...)
}

#' @rdname xmap
#' @export

xmap_chr <- function(.l, .f, ...) {
  purrr::pmap_chr(cross_list(.l), .f, ...)
}

#' @rdname xmap
#' @export

xmap_dbl <- function(.l, .f, ...) {
  purrr::pmap_dbl(cross_list(.l), .f, ...)
}

#' @rdname xmap
#' @export

xmap_dfc <- function(.l, .f, ...) {
  purrr::pmap_dfc(cross_list(.l), .f, ...)
}

#' @rdname xmap
#' @export

xmap_dfr <- function(.l, .f, ..., .id = NULL) {
  purrr::pmap_dfr(cross_list(.l), .f, ..., .id)
}

#' @rdname xmap
#' @export

xmap_int <- function(.l, .f, ...) {
  purrr::pmap_int(cross_list(.l), .f, ...)
}

#' @rdname xmap
#' @export

xmap_lgl <- function(.l, .f, ...) {
  purrr::pmap_lgl(cross_list(.l), .f, ...)
}

#' @rdname xmap
#' @export

xmap_raw <- function(.l, .f, ...) {
  lifecycle::deprecate_warn("0.4.0", "xmap_raw()", "xmap_vec()")
  purrr::pmap_raw(cross_list(.l), .f, ...)
}

#' @rdname xmap
#' @export

xwalk <- function(.l, .f, ...) {
  purrr::pwalk(cross_list(.l), .f, ...)
}

