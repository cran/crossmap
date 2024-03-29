#' Parallelized mapping functions that automatically determine type
#'
#' These functions work exactly the same as [map_vec()], [map2_vec()],
#' [pmap_vec()], [imap_vec()] and [xmap_vec()],
#' but allow you to map in parallel.
#'
#' @inheritParams map_vec
#' @inheritParams future_xmap
#'
#' @return Equivalent to [map_vec()], [map2_vec()], [pmap_vec()],
#'   [imap_vec()] and [xmap_vec()]
#'
#' @seealso The original functions: [furrr::future_map()],
#'   [furrr::future_map2()], [furrr::future_pmap()], [furrr::future_imap()]
#'   and [future_xmap()]
#'
#'   Non-parallelized equivalents: [map_vec()], [map2_vec()],
#'   [pmap_vec()], [imap_vec()] and [xmap_vec()]
#'
#' @export
#'
#' @example examples/future_map_vec.R

future_map_vec <- function(
  .x, .f, ..., .class = NULL,
  .progress = FALSE, .options = furrr::furrr_options()
) {
  require_furrr()

  vectorize(
    furrr::future_map(.x, .f, ..., .progress = .progress, .options = .options),
    .class = .class
  )
}

#' @rdname future_map_vec
#' @export

future_map2_vec <- function(
  .x, .y, .f, ..., .class = NULL,
  .progress = FALSE, .options = furrr::furrr_options()
) {
  require_furrr()

  vectorize(
    furrr::future_map2(.x, .y, .f, ..., .progress = .progress, .options = .options),
    .class = .class
  )
}

#' @rdname future_map_vec
#' @export

future_pmap_vec <- function(
  .l, .f, ..., .class = NULL,
  .progress = FALSE, .options = furrr::furrr_options()
) {
  require_furrr()

  vectorize(
    furrr::future_pmap(.l, .f, ..., .progress = .progress, .options = .options),
    .class = .class
  )
}

#' @rdname future_map_vec
#' @export

future_imap_vec <- function(
  .x, .f, ..., .class = NULL,
  .progress = FALSE, .options = furrr::furrr_options()
) {
  require_furrr()

  vectorize(
    furrr::future_imap(.x, .f, ..., .progress = .progress, .options = .options),
    .class = .class
  )
}

#' @rdname future_map_vec
#' @export

future_xmap_vec <- function(
  .l, .f, ..., .class = NULL,
  .progress = FALSE, .options = furrr::furrr_options()
) {
  require_furrr()

  vectorize(
    future_xmap(.l, .f, ..., .progress = .progress, .options = .options),
    .class = .class
  )
}
