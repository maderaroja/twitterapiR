followersCount <- function(key, secret, screenName, count=1, resultType = "numeric"){
    
    if (nchar(screenName) > 100) {
        stop("screenName can only be up to 100 characters")
    } else if (nchar(screenName) == 0) {
        stop("screenName cannot be empty")
    }
    
    if (count <= 0) {
        stop("count must be positive")
    }
    
    if (!(resultType ==0)){
        stop("Accurate followers count can't be had at this moment. Please try again.
             Or user has no follower")
    }
    

    app_keys <- openssl::base64_encode(paste0(key, ":", secret))
    r <- httr::POST("https://api.twitter.com/oauth2/token",
                httr::add_headers(Authorization = paste0("Basic ", app_keys)),
                body = list(grant_type = "client_credentials"))
    bearer <- httr::content(r, encoding = "UTF-8")

    screenName <- URLencode(screenName, reserved = TRUE) # encode characters in URLs

    base <- "https://api.twitter.com/1.1/users/show.json?"

    url <- paste0(base,searchName, '&',count,'&',resultType) #Should I use screenName? already exists

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
                          statuses.user.screen_name,
                          statuses.user.followers_count,
                          statuses.user.friends_count)
    

    data <- dplyr::rename(data, 
            user_screen_name = statuses.user.screen_name,
            user_follower_count = statuses.user.followers_count,
            user_friends_count = statuses.user.friends_count)
    
    data <- dplyr::merge(user_screen_name, user_follower_count)

    return(data)
}


user_friends <- function(key, secret, screen_name, number = 195){
    if (number > 195){
        stop("The number of users to return per page, up to a maximum of 195")
    }
    
    # generate bearer key
    app_keys <- openssl::base64_encode(paste0(key, ":", secret))
    r <- httr::POST("https://api.twitter.com/oauth2/token",
                    httr::add_headers(Authorization = paste0("Basic ", app_keys)),
                    body = list(grant_type = "client_credentials"))
    bearer <- httr::content(r, encoding = "UTF-8")
    
    base_url = "https://api.twitter.com/1.1/friends/list.json?"
    
    full_url = glue(base_url, 'screen_name={screen_name}&count={number}')
    
    
    res=GET(full_url, add_headers(
        Authorization=paste0("Bearer ", bearer$access_token))
    )
    
    #check connection
    if (res$status_code != '200'){
        stop(paste("Connection Failed! Please see the following detail: \n",res))
    }
    
    obj <- httr::content(res, as = "text")
    
    json_data <- fromJSON(obj, flatten = TRUE)
    
    
    data <- json_data$users  %>% select(name,screen_name, description) %>% as.data.frame()
    
    return(data)
}