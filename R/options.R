cacheEnv <- new.env()

assign('tags.url', 'http://api.avoindata.net/tags', envir=cacheEnv)
assign('categories.url', 'http://api.avoindata.net/categories', envir=cacheEnv)
       