searchTweets <- function(key, secret, searchString, count = 5, resultType = "mixed"){
  
  if (nchar(searchString) > 100) {
    stop("searchString can only be up to 100 characters")
  } else if (nchar(searchString) == 0) {
    stop("searchString can not be empty")
  }
  
  if (count <= 0) {
    stop("count must be positive")
  }
  count <- as.integer(count)
  
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
  
  res = httr::GET(url, httr::add_headers(Authorization=paste0("Bearer ", bearer$access_token)))
  
  #check connection
  if (res$status_code != '200'){
    stop(paste("Connection Failed! Please see the following detail: \n",res))
  }
  
  obj <- httr::content(res, as = "text")
  
  json_data <- jsonlite::fromJSON(obj, flatten = TRUE)
  
  data <- as.data.frame(json_data)
  
  #select columns that we are interested
  data <- dplyr::select(data, 
                        statuses.created_at,
                        statuses.user.name, 
                        statuses.user.screen_name,
                        statuses.user.followers_count,
                        statuses.text, 
                        statuses.truncated, 
                        statuses.favorited,
                        statuses.retweeted,
                        statuses.favorite_count,
                        statuses.retweet_count)
  
  
  data <- dplyr::rename(data,
                        created_time = statuses.created_at,
                        user_name = statuses.user.name,
                        user_screen_name = statuses.user.screen_name,
                        user_followers_count = statuses.user.followers_count,
                        text = statuses.text,
                        truncated = statuses.truncated,
                        favorited = statuses.favorited,
                        retweeted = statuses.retweeted,
                        favorite_count = statuses.favorite_count,
                        retweet_count = statuses.retweet_count)
  
  return(data)
}