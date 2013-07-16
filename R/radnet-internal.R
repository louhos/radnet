.First <- function () {
    options(repos = c(CRAN = "http://cran.rstudio.com/"), 
            browserNLdisabled = TRUE, 
            deparse.max.lines = 2)
}

cacheEnv <- new.env()
assign('tags.url', 'http://api.avoindata.net/tags', envir=cacheEnv)
assign('categories.url', 'http://api.avoindata.net/categories', envir=cacheEnv)