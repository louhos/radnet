.First <- function () {
    options(repos = c(CRAN = "http://cran.rstudio.com/"), 
            browserNLdisabled = TRUE, 
            deparse.max.lines = 2)
}

urlEnv <- new.env()
assign('tags.url', 'http://api.avoindata.net/tags', envir=urlEnv)
assign('categories.url', 'http://api.avoindata.net/categories', envir=urlEnv)
assign('questions.url', 'http://api.avoindata.net/questions', envir=urlEnv)
assign('answers.url', 'http://api.avoindata.net/answers', envir=urlEnv)