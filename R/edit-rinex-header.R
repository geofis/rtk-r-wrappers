editrnxhd <- function(fromcors = T, newpos){
  if(fromcors) 
    newpos <- newpos <- '  2078678.8000 -5683737.3030  2006886.8270                  '
  else
    newpos <- newpos
  obsfile <- grep(
    'unavco.*[0-9]\\.[0-9][0-9]o$',
    list.files(recursive = T),
    value = T)
  y <- gsub('o', '', gsub('^.*\\.','', obsfile))
  foo <- readLines(obsfile)
  bar <- gsub(
    '(.*[0-9].*APPROX)',
    paste0('  2078678.8000 -5683737.3030  2006886.8270                  ', 'APPROX'),
    foo)
  writeLines(bar, gsub(paste0('.',y,'o'),paste0('_edited.',y,'o'),obsfile))
}
