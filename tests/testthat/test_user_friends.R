key <- Sys.getenv("TWITTER_API_KEY")
secret <- Sys.getenv("TWITTER_API_SECRET")
setted <- set_bearer(key, secret)

test_that("Incorrect inputs", {
    # invalid screen_name
    expect_error(user_friends(screen_name="BarackObamaa", number =10))
    # invalid number
    expect_error(user_friends(screen_name="BarackObama", number = 2000))
})

test_that("output is a data frame",{
    output <- user_friends(screen_name="BarackObama", number =10)
    expect_true(is.data.frame(output))
})

