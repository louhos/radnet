.First <- function () {
    options(repos = c(CRAN = "http://cran.rstudio.com/"), 
            browserNLdisabled = TRUE, 
            deparse.max.lines = 2)
}

urlEnv <- new.env()
assign('answers.url', 'http://api.avoindata.net/answers', envir=urlEnv)
assign('categories.url', 'http://api.avoindata.net/categories', envir=urlEnv)
assign('questions.url', 'http://api.avoindata.net/questions', envir=urlEnv)
assign('tags.url', 'http://api.avoindata.net/tags', envir=urlEnv)
assign('users.url', 'http://api.avoindata.net/users', envir=urlEnv)
