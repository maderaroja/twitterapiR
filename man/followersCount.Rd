\name{followersCount}
\alias{followersCount}

\title{followersCount

}
\description{
This function will accept the screen name of a user and output the total number of followers of that user
}
\usage{
followersCount(screen_name)
}

\arguments{
  \item{screen_name}{
A string of one Twitter screen name
}
}

\value{
A dataframe containing the following columns:
\item{screen_name}{The screen name of the user}

}
\references{
\url{https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-followers-list}
}
\author{
Nyanda Redwood
}

\examples{
#followersCount(screen_name ="BarackObama")
}

