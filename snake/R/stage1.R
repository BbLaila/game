#' stage1
#'
#' `stage1` for the game playing.
#'
#'
#'
#' @export

stage1 <- function(){
  e$stage <- 1

  fruit <- function(){
    if(length(index(e$col_fruit)) <= 0){
      idx <- sample(index(e$col_path),1)

      fx = ifelse(idx %% e$width == 0, 10, idx %% e$width)
      fy = ceiling(idx/e$height)
      e$m[fx, fy] <- e$col_fruit

      beepr::beep()
      print(paste("fruit idx", idx))
      print(paste("fruit axis:", fx, fy))
    }
  }

  barrier <- function(){
    if(length(index(e$col_barrier)) != 0){
      idx <- index(e$col_barrier)
      fx = ifelse(idx %% e$width == 0, 10, idx %% e$width)
      fy = ceiling(idx/e$height)
      if(e$move %% 2 == 0){
        if(fx != 19){
          e$m[fx + 1, fy] <- e$col_barrier
          e$m[fx, fy] <- e$col_path

        }else{
          e$m[fx - 1, fy] <- e$col_barrier
          e$m[fx, fy] <- e$col_path
          e$move = e$move + 1
        }
      }else{
        if(fx != 1){
          e$m[fx - 1, fy] <- e$col_barrier
          e$m[fx, fy] <- e$col_path
        }else{
          e$m[fx + 1, fy] <- e$col_barrier
          e$m[fx, fy] <- e$col_path
          e$move = e$move + 1
        }
      }
      e$barrier[1,1] = fx
      e$barrier[1,2] = fy
    }
  }


  fail <- function(){
    if(length(which(e$head < 1)) >0 | length(which(e$head > e$width))>0){
      print("game over: Out of ledge.")
      beepr::beep()
      keydown('q')
      return(TRUE)
    }

    if(e$m[e$head[1], e$head[2]] == e$col_tail){
      print("game over: head hit tail")
      beepr::beep()
      keydown('q')
      return(TRUE)
    }

    if(e$m[e$head[1], e$head[2]] == e$col_barrier | (length(index(e$col_barrier)) == 0)){
      print("game over: hit barrier.")
      beepr::beep()
      keydown('q')
      return(TRUE)
    }

    return(FALSE)
  }

  head <- function(){
    e$lastx = e$head[1]
    e$lasty = e$head[2]

    if(e$dir == "up") e$head[2] = e$head[2] + 1
    if(e$dir == "down") e$head[2] = e$head[2] - 1
    if(e$dir == "left") e$head[1] = e$head[1] - 1
    if(e$dir == "right") e$head[1] = e$head[1] + 1
  }

  body <- function(){
    e$m[e$lastx, e$lasty] = 0
    e$m[e$head[1], e$head[2]] <- e$col_head
    if(length(index(e$col_fruit)) <= 0){
      e$tail <- rbind(e$tail, data.frame(x = e$lastx, y = e$lasty))
    }

    if(nrow(e$tail) > 0){
      e$tail <- rbind(e$tail, data.frame(x = e$lastx, y = e$lasty))
      e$m[e$tail[1,]$x, e$tail[1,]$y] <- e$col_path
      e$tail <- e$tail[-1,]
      e$m[e$lastx, e$lasty] = e$col_tail
    }

    if(nrow(e$tail) > 3 & length(index(e$col_fruit)) <= 0){
      e$tail <- rbind(e$tail, data.frame(x = e$lastx, y = e$lasty))
      e$m[e$tail[1,]$x, e$tail[1,]$y] <- e$col_path
      e$m[e$lastx, e$lasty] = e$col_tail
    }

    print(paste0("snake tail", e$tail))
    print(paste("snake idx", index(e$col_head)))
    print(paste("snake axis:", e$head[1], e$head[2]))
  }

  drawTable <- function(){
    plot(0, 0, xlim = c(0,1), ylim = c(0,1), type = 'n',xaxs = 'i', xaxs = 'i', yaxs = 'i')
  }

  drawMatrix <- function(){
    idx <- which(e$m > 0)
    px = (ifelse(idx %% e$width == 0, e$width, idx %% e$width)-1)/e$width + e$step/2
    py = (ceiling(idx/e$height)-1)/e$height+e$step/2
    pxy = data.frame(x = px, y = py, col = e$m[idx])
    n = ifelse(nrow(e$tail) <= 3, nrow(e$tail), 3 + (nrow(e$tail) - 3)/2)
    points(pxy$x, pxy$y, col = pxy$col, pch = 15, cex = 4.4)
    text(0.12, 0.02, labels = paste("You have eat", n, "fruits!"), cex = 1)
  }


  fruit()
  head()
  if(!fail()){
    barrier()
    body()
    drawTable()
    drawMatrix()
  }
}
