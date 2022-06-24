#' stage0
#'
#' `stage0` for the game starting.
#'
#'
#'
#' @export


stage0 <- function(){
  e$stage <- 0
  plot(0, 0, xlim = c(0, 1), ylim = c(0, 1),
       type = 'n', xaxs = "i", yaxs = 'i')
  text(0.5, 0.7, labels = "Snake Game", cex = 5)
  text(0.5, 0.4, labels = "Any keyboard to start", cex = 2, col = 4)
  text(0.5, 0.3, labels = "Up, Down, Left, Right to control direction", cex = 2, col = 2)
  text(0.2, 0.05, labels = "Author: DanZhang", cex = 1)
  text(0.5, 0.05, labels = "http://blog.fens.me", cex = 1)
}
