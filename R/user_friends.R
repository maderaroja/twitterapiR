user_friends <- function(screen_name, number = 195){
    if (number > 195){
        stop("The number of users to return per page, up to a maximum of 195")
    }
    
    bearer = get_bearer()
    
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





Sys.setenv(key = 'Tds7CCMzPsJbRZH7aikpKiObN')
Sys.getenv('key')
Sys.setenv(secret = 'lPH7pIQIS1pVinxh48xvXWgqzGa9gre4Utb9tIZ2W1U0nSCgrz')
Sys.getenv('secret')
#Sys.unsetenv("key")
#df = user_friends(key, secret, screen_name ="BarackObama", 100)
user_friends(screen_name="BarackObama", number =10)

