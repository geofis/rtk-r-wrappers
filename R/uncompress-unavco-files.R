unavcounc <- function(){
  zdir <- grep('unavco', list.dirs(recursive = T), value = T)
  # Uncompress module
  system(paste0('uncompress -k ', zdir, '/*.Z'))
}
