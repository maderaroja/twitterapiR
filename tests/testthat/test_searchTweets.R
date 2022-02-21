
key <- "Tds7CCMzPsJbRZH7aikpKiObN"
secret <- "lPH7pIQIS1pVinxh48xvXWgqzGa9gre4Utb9tIZ2W1U0nSCgrz"
setted <- set_bearer(key, secret)

test_that("Incorrect inputs", {
    expect_error(searchTweets(searchString="#ubc" ,resultType = "all", count = 5))
    expect_error(searchTweets(searchString="#ubc" ,resultType = "mixed", count = -10))
    expect_error(searchTweets(searchString="#ubc" ,resultType = "mixed", count = 1000))
})

test_that("output is a DataFrame",{
    output <- searchTweets(searchString="#ubc" ,resultType = "mixed", count = 3)
    expect_true(is.data.frame(output))
})