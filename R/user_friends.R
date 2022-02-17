user_friends <- function(screen_name, number = 195){
    if (number > 195){
        stop("The number of users to return per page, up to a maximum of 195")
    }
    
    bearer = get_bearer()
    
    base_url = "https://api.twitter.com/1.1/friends/list.json?"
    
    full_url = glue::glue(base_url, 'screen_name={screen_name}&count={number}')
    
    
    res=httr::GET(full_url, httr::add_headers(
        Authorization=paste0("Bearer ", bearer$access_token))
    )
    
    #check connection
    if (res$status_code != '200'){
        stop(paste("Connection Failed! Please see the following detail: \n",res))
    }
    
    obj <- httr::content(res, as = "text")
    
    json_data <- jsonlite::fromJSON(obj, flatten = TRUE)
    
    
    data <- dplyr::select(json_data$users,name,screen_name, description)
    data <- as.data.frame(data)
    
    return(data)
}

