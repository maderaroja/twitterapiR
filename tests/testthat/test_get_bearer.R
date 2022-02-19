
test_that("API key is retreived", {
    skip_if_no_auth()
    Sys.setenv(key = Sys.getenv("TWITTER_API_KEY"))
    Sys.setenv(secret =  Sys.getenv("TWITTER_API_SECRET"))
    expect_type(get_bearer(), "list")
})

test_that("Invalid bearer key correctly fails", {
    skip_if_no_auth()
    # invalid key and secret
    Sys.setenv(key = 'xxxxxxxxxxxxxxxxx')
    Sys.setenv(secret = 'xxxxxxxxxxxxxxxxxxx')
    expect_error(get_bearer())
    # invalid key and secret
    Sys.unsetenv("key")
    Sys.unsetenv("secret")
    expect_error(get_bearer())
})
