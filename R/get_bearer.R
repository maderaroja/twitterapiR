get_bearer <- function() {
     #' get_bearer
     #' 
     #' @description This function is a helper function that can be used to help generate bearer key using API key and API secret.
     #' 
     #' @usage get_bearer()
     #' @return If the key and secret are valid, the function will return a list of the type and key.
     #' 
     #' @details The key and secret key is required to use the functions in twitterapiR package and query information from Twitter.
     #' 
     #' @examples
     #' key = 'YOUR-KEY-HERE'
     #' secret = 'YOUR-SECRET-HERE'
     #' get_bearer()
     #' 
     #' @export
     #' 
    key <- Sys.getenv("key")
    secret<-Sys.getenv("secret")
    if (key == "" | secret == "") {
        stop("You must provide an API key to the function or use `Sys.setenv(key = 'your_key_here')`, `Sys.setenv(secret = 'your_secret_key_here')`")
    }
    app_keys <- openssl::base64_encode(paste0(key, ":", secret))
    r <- httr::POST("https://api.twitter.com/oauth2/token",
                    httr::add_headers(Authorization = paste0("Basic ", app_keys)),
                    body = list(grant_type = "client_credentials"))
    bearer <- httr::content(r, encoding = "UTF-8")
    
    if (!is.null(bearer$errors)){
        stop("Invalid key or secret, please see the following details: https://developer.twitter.com/en/docs/twitter-api/getting-started/getting-access-to-the-twitter-api")
    }else{
        return(bearer)
    }
}
