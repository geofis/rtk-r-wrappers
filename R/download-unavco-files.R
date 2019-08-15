unavcodown <- function(y, d, st, dl = T, unc = T){
  # Dowload UNAVCO RINEX files
  # Example: unavcodown(y = 19,d = '2019-08-03', st = 'rdsd', dl = T, unc = T)
  # Args:
  #   y:    One two digits integer indicating the year
  #   d:    Character string of date in YYYY-MM-DD format. Example: '2019-08-13'
  #   st:   One character string of the station name
  #   dl:   Download files
  #   unc:  Uncompress *.Z files
  # Returns:
  #   Files downloaded in a folder named '<st><d>0.<y>' located in the working directory
  
  # Generate remote file names 
  pre <- 'o'
  tp <- c('obs', 'nav')
  d <- strftime(d, format = '%j')
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
  dir <- paste0(st, d, '/unavco')
  if(dl){
    system(paste0('mkdir -p ', dir))
  }
  # Download module
  if(dl){
    i <- NULL
    for(i in files){
      wget <- paste0('wget -P ', dir, ' ', i)
      system(wget)
    }
  }
}
