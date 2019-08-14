unavcodown <- function(y, d, st, dl = T, unc = T){
  # Dowload UNAVCO RINEX files
  # Example: unavcodown(y = 19,d = 223, st = 'rdsd', dl = T, unc = T)
  # Args:
  #   y:    One two digits integer indicating the year
  #   d:    One integer indicating the DOY
  #   st:   One character string of the station name
  #   dl:   Download files
  #   unc:  Uncompress *.Z files
  # Returns:
  #   Files downloaded and unzipped in a folder named '<st><d>0.<y>' located in the working directory
  
  # Generate remote file names 
  pre <- 'o'
  tp <- c('obs', 'nav')
  foo <- lapply(
    tp,
    function(x){
      paste0(
        'ftp://data-out.unavco.org/pub/rinex/', x, '/20',
        y, '/',
        d, '/',
        st, d, '0.', y, if(x=='obs') 'o' else c('e','g','n'), '.Z')
    }
  )
  files <- unlist(foo)
  #Subfolder creation
  dir <- paste0(st, d)
  if(dl){
    system(paste0('mkdir ', dir))
  }
  # Download module
  if(dl){
    i <- NULL
    for(i in files){
      wget <- paste0('wget -P ', dir, ' ', i)
      system(wget)
    }
  }
  # Uncompress module
  system(paste0('uncompress ', dir, '/*.Z'))
  # return(list(files, dir, wget))
}
