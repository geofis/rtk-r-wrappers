unavcounc <- function(){
  zdir <- list.files(
    path = grep('unavco', list.dirs(recursive = T), value = T),
    pattern = '.Z$', full.names = T
  )
  # Uncompress module
  system(paste0('uncompress -k ', zdir, '/*.Z'))
  
}