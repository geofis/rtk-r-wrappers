rtklibwf <- function(y, d, st, from){
  ghpath <- 'https://raw.githubusercontent.com/geofis/rtk-r-wrappers/master/R/'
  if(from == 'unavcodown'){
    if(identical(grep('^unavcodown$', ls(.GlobalEnv)), integer(0))){
      require(devtools)
      source_url(paste0(ghpath, 'download-unavco-files.R'))
    }
    unavcodown(y = y,d = d, st = st, dl = T, unc = T)
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
    convrtkp()
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
