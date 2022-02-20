key <- "Tds7CCMzPsJbRZH7aikpKiObN"
secret <- "lPH7pIQIS1pVinxh48xvXWgqzGa9gre4Utb9tIZ2W1U0nSCgrz"
setted <- set_bearer(key, secret)

test_that("Incorrect inputs", {
    # invalid screen_name
    expect_error(followersCount(screen_name="BarackObamaa"))
})

test_that("output is a data frame",{
    output <- followersCount(screen_name="BarackObama")
    expect_true(is.data.frame(output))
})