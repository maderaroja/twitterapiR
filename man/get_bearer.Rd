\name{get_bearer}
\alias{get_bearer}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A function to get the bearer key
}
\description{
Retrieves key, and secret key from environment if available.
}
\usage{
get_bearer()
}


\details{
The key and secret key is required to use the functions in twitterapiR package and query information
from Twitter.
}
\value{
A list contains following items:
\item{token_type}{bearer type of key}
\item{access_token}{bearer key}
...
}
\references{
\url{https://developer.twitter.com/en/docs/twitter-api/getting-started/getting-access-to-the-twitter-api}
}
\author{
Ling Xiang, Zou
}

\examples{

#get_bearer()

}

