delrnx <- function(){
  rnxfiles <- list.files(
    path = grep('unavco', list.dirs(recursive = T), value = T),
    pattern = '.*[egno]$', full.names = T
  )
  invisible(nfiles <- file.remove(rnxfiles))
  message <- paste0('Deleted rinex files: ', length(nfiles))
  return(message)
}
