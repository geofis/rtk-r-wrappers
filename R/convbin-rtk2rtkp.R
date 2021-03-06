convrtkp <- function(convubx = T, conf = '03', editedhd = T){
  confile <- paste0('rtkpost', conf, '.conf')
  if(!length(list.files(pattern = paste0(confile,'$')))==1){
    download.file(
      paste0(
        'https://raw.githubusercontent.com/geofis/',
        'rtk-r-wrappers/master/conf/',
        'rtkpost', conf, '.conf'
      ),
      destfile = confile
    )
  }
  ubx <- list.files(pattern = '*.ubx')
  if(convubx) {
    system(
      paste0(
        'convbin -od -os -oi -ot -v 3.03 ',
        ubx
      )
    )
  }
  obs <- list.files(pattern = '*.obs')
  if(editedhd){
    obsref <- list.files(pattern = '*_edited\\.[0-9][0-9]o$', recursive = T)
  } else {
    obsref <- list.files(pattern = '*[0-9]\\.[0-9][0-9]o$', recursive = T)
  }
  nav <- list.files(pattern = '*.[0-9][0-9][egn]$', recursive = T)
  system(
    paste0(
      'rnx2rtkp -k ', 
      confile, ' -o ', gsub('.ubx', paste0('_conf', conf, '_solution.pos'), ubx),
      ' ', obs, ' ', obsref,
      ' ', paste0(nav, collapse = ' ')
    )
  )
}