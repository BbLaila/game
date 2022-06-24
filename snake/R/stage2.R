#' stage2
#'
#' `stage2` for the game over.
#'
#'
#'
#' @export


stage2 <- function(){
  e$stage <- 2
  plot(0, 0, xlim = c(0, 1), ylim = c(0, 1),
       type = 'n', xaxs = "i", yaxs = 'i')
  text(0.5, 0.7, labels = "Game Over", cex = 5)
  text(0.5, 0.4, labels = "Space to restart, q to quit", cex = 2, col = 4)
  text(0.5, 0.3, labels = paste("Congratulations! You have eat", nrow(e$tail), "fruits!"), cex = 2, col = 2)
  text(0.2, 0.05, labels = "Author: DanZhang", cex = 1)
  text(0.5, 0.05, labels = "http://blog.fens.me", cex = 1)
}
