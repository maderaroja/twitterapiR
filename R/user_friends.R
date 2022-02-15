
user_friends <- function(key, secret, screen_name, number = 200){
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
    
    
    obj <- httr::content(res, as = "text")
    
    json_data <- fromJSON(obj, flatten = TRUE)
    
    if(!is.null(json_data$error)){
        stop("Error: Invalid inputs!")
    }else{
        data <- json_data$users  %>% select(name,screen_name, description) %>% as.data.frame()
    }
    return(data)
}


#key = 'Tds7CCMzPsJbRZH7aikpKiObNs'
#secret= 'lPH7pIQIS1pVinxh48xvXWgqzGa9gre4Utb9tIZ2W1U0nSCgrz'
#df = user_friends(key, secret, screen_name ="BarackObama", 10)
