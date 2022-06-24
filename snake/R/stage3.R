#' stage3
#'
#' `stage3` for the game pause.
#'
#'
#'
#' @export


stage3 <- function(){
  e$stage <- 3
  plot(0, 0, xlim = c(0, 1), ylim = c(0, 1),
       type = 'n', xaxs = "i", yaxs = 'i')
  text(0.5, 0.7, labels = "Game Pause", cex = 5)
  text(0.5, 0.4, labels = "p to restart", cex = 2, col = 4)
}
