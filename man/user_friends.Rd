\name{user_friends}
\alias{user_friends}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A function to output the friends of one user
}
\description{
 This function will accept a screen name of a user and output the name, screen name, and names of the user's friends.
}
\usage{
user_friends(screen_name, number = 195)
}

\arguments{
  \item{screen_name}{
A string of one Twitter screen name
}
  \item{number}{
The number of friends to output, the default is 195.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
This will only work correctly with users that have public profiles, or if you are authenticated or granted access.

}
\value{
A DataFrame that contains the following columns:
\item{name}{The name of the user}

\item{screen_name}{The screen name of the user}

\item{description}{The description of the user}

}
\references{
\url{https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friends-list}
}
\author{
Ling Xiang Zou
}


\examples{
#user_friends(screen_name ="BarackObama", 10)
}
