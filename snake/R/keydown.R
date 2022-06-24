#' keydown
#'
#' `keydown` for the keyboard setting.
#'
#'
#'
#' @export


keydown <- function(K){
  print(paste("keydown:",K,",stage:",e$stage));
  if(e$stage == 0){
    init()
    stage1()
    return(NULL)
  }
  if(e$stage == 2){
    if(K == "q") q()
    else if(K == " ") stage0()
    return(NULL)
  }
  if(e$stage == 1){
    if(K == "q"){
      stage2()
    }else{
      if(K == "p"){
        stage3()
      }else{
        if(tolower(K) %in% c("up", "down", "left", "right")){
          e$lasted <- e$dir
          e$dir <- tolower(K)
          stage1()
        }
      }
    }

    return(NULL)
  }
  if(e$stage == 3){
    if(K == "p"){
      stage1()
      e$stage = 1
    }else if(K == "q") q()
    return(NULL)
  }
}
