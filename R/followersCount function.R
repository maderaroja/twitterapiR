followersCount <- function(key, secret, screen_name){
    
    if (nchar(screen_name) > 100) {
        stop("screen_name can only be up to 100 characters")
    } else if (nchar(screen_name) == 0) {
        stop("screen_name cannot be empty")
    }
    
    
    app_keys <- openssl::base64_encode(paste0(key, ":", secret))
    r <- httr::POST("https://api.twitter.com/oauth2/token",
                httr::add_headers(Authorization = paste0("Basic ", app_keys)),
                body = list(grant_type = "client_credentials"))
    bearer <- httr::content(r, encoding = "UTF-8")

    screen_name <- URLencode(screen_name, reserved = TRUE) # encode characters in URLs

    base <- "https://api.twitter.com/1.1/users/show.json?screen_name="

    url <- paste0(base, screen_name)

    res = httr::GET(url, httr::add_headers(Authorization=paste0("Bearer ", bearer$access_token)))
    
    #check connection
    if (res$status_code != '200'){
    stop(paste("Connection Failed! Please see the following detail: \n",res))
    }
    
    obj <- httr::content(res, as = "text")
    
    json_data <- jsonlite::fromJSON(obj, flatten = TRUE)
    screen_name <- as.data.frame(json_data$screen_name)
    followers_count <- as.data.frame(json_data$followers_count)
    data <- merge(screen_name, followers_count)
    colnames(data) <- c('screen_name', 'followers_count')
    

    return(data)
    
}
try_obama <- followersCount('Tds7CCMzPsJbRZH7aikpKiObN', 'lPH7pIQIS1pVinxh48xvXWgqzGa9gre4Utb9tIZ2W1U0nSCgrz', 'BarackObama')
try_obama
