#' run
#'
#' `run` for running the game.
#'
#'
#'
#' @export

run <- function(){
  X11(type = "Xlib")
  par(mai = rep(0,4), oma = rep(0, 4))
  e <<- new.env()
  stage0()
  getGraphicsEvent(prompt = "Snake Game", onKeybd = keydown)
}
