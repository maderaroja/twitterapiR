set_bearer <- function(key, secret){
    
    if (key == "" || secret == "" ) {
        stop("You must provide an API key to the function!!")
    }
    
    #set key and secret as environment variable
    Sys.setenv("key"= key) 
    Sys.setenv("secret" = secret)
    
    tryCatch(
        expr = {
            my_key <- Sys.getenv("key")
            my_secret<-Sys.getenv("secret")
        },
        error = function(e){
            message('Can not set key and secret!') #if we can not get key and secret
            print(e)
            return(FALSE)
        },
        finally = {
            if (my_key == key && my_secret == secret){
                return(TRUE)
            } else {  #if key or secret are not match
                message('Error in set key and secret!')
                return(FALSE)
                
            }
        }
    )    
}