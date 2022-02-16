\name{followersCount}
\alias{followersCount}
\title{Followers Count}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{
This function will return all authorized followers that match the search conditions.
}
\description{
This function will accept the screen name of a user and output the total number of followers of that user, the user's name, and the total number of the user's friends.

}
\usage{
user_friends(screen_name = character(), number = 200)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{screen_name}{
A string of one Twitter screen name
}
  \item{number}{
The number of followers to output. Under strain, this may output 0.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A data.frame, one row for each friend with columns name, screen_name, number.
}
\references{
https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-followers-list
}
\author{
Nyanda Redwood
}
\examples{
user_followers(key, secret, screen_name ="BarackObama", 10)



