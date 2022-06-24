#' init
#'
#' `init` set the init environment.
#'
#'
#'
#' @export

init <- function(){
  e <<- new.env()
  e$stage = 0
  e$width = e$height = 20
  e$step = 1/e$width
  e$m = matrix(rep(0, e$width * e$height), nrow = e$width)
  e$dir = e$lastd = "up"
  e$head = c(2, 2)
  e$lastx = e$lasty = 2
  e$tail = data.frame(x = c(), y = c())

  e$move = 1
  e$col_fruit = 2
  e$col_head = 4
  e$col_tail = 8
  e$col_path = 0
  e$col_barrier = 1
  e$barrier = data.frame(x = 10, y = 10)
  e$m[10, 10] <- e$col_barrier

  e$p = 0
}
