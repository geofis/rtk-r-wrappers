convrtkp <- function(conf = '01'){
  download.file(
    paste0(
      'https://raw.githubusercontent.com/geofis/',
      'rtk-r-wrappers/master/conf/',
      'rtkpost', conf, '.conf'
    ),
    destfile = paste0('rtkpost', conf, '.conf')
  )
  ubx <- list.files(pattern = '*.ubx')
  system(
    paste0(
      'convbin -od -os -oi -ot -v 3.03 ',
      ubx
    )
  )
}