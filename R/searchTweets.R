searchTweets <- function(key, secret, searchString, count = 5, resultType = "mixed"){
  # check searchString is valid
  if (nchar(searchString) > 100) {
    stop("searchString can only be up to 100 characters")
  } else if (nchar(searchString) == 0) {
    stop("searchString can not be empty")
  }
  
  #check count is valid
  if (count <= 0) {
    stop("count must be positive")
  }
  count <- as.integer(count)
  
  #check resultType is valid
  if (!(resultType %in% c("mixed", "recent", "popular"))){
    stop("resultType can only be mixed or recent or popular")
  }
  
  
  app_keys <- openssl::base64_encode(paste0(key, ":", secret))
  
  
  r <- httr::POST("https://api.twitter.com/oauth2/token",
                  httr::add_headers(Authorization = paste0("Basic ", app_keys)),
                  body = list(grant_type = "client_credentials"))
  bearer <- httr::content(r, encoding = "UTF-8")
  
  searchString <- URLencode(searchString, reserved = TRUE) # encode characters in URLs
  
  base <- "https://api.twitter.com/1.1/search/tweets.json?q="
  
  url <- paste0(base,searchString,"&",count,"&",resultType)
  
  res=httr::GET(url, add_headers(Authorization=paste0("Bearer ", bearer$access_token)))
  
  obj <- httr::content(res, as = "text")
  
  json_data <- jsonlite::fromJSON(obj, flatten = TRUE)
  
  data <- as.data.frame(json_data)
  
  return(data)
  
}