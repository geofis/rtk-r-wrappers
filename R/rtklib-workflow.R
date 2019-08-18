rtklibwf <- function(y, d, st = 'rdsd', convubx = T, conf = '03', from = 'unavcodown', editedhd = T){
  #Example1: rtklibwf(y = 19, d = '2019-08-16', conf = '03')
  #Example2: rtklibwf(y = 19, d = '2019-08-16', conf = '05', from = 'unavcounc')
  #Example3: rtklibwf(y = 19, d = '2019-08-16', convubx = F, conf = '03', from = 'unavcounc')
  #Example4: rtklibwf(y = 19, d = '2019-08-17', conf = '03', editedhd = F, from = 'unavcounc', convubx = F)
  ghpath <- 'https://raw.githubusercontent.com/geofis/rtk-r-wrappers/master/R/'
  if(from == 'unavcodown'){
    if(identical(grep('^unavcodown$', ls(.GlobalEnv)), integer(0))){
      require(devtools)
      source_url(paste0(ghpath, 'download-unavco-files.R'))
    }
    unavcodown(y = y,d = d, st = st, dl = T, unc = T)
    from <- 'unavcounc'
  }
  if(from == 'unavcounc'){
    if(identical(grep('^unavcounc$', ls(.GlobalEnv)), integer(0))){
      require(devtools)
      source_url(paste0(ghpath, 'uncompress-unavco-files.R'))
    }
    unavcounc()
    from <- 'editrnxhd'
  }
  if(from == 'editrnxhd'){
    if(identical(grep('^editrnxhd$', ls(.GlobalEnv)), integer(0))){
      require(devtools)
      source_url(paste0(ghpath, 'edit-rinex-header.R'))
    }
    editrnxhd()
    from <- 'convrtkp'
  }
  if(from == 'convrtkp'){
    if(identical(grep('^convrtkp$', ls(.GlobalEnv)), integer(0))){
      require(devtools)
      source_url(paste0(ghpath, 'convbin-rtk2rtkp.R'))
    }
    convrtkp(convubx = convubx, conf = conf, editedhd = editedhd)
    from <- 'delrnx'
  }
  if(from == 'delrnx'){
    if(identical(grep('^delrnx$', ls(.GlobalEnv)), integer(0))){
      require(devtools)
      source_url(paste0(ghpath, 'delete-uncompressed-rinex.R'))
    }
    delrnx()
  }
}
