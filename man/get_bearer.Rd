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
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
\url{https://developer.twitter.com/en/docs/twitter-api/getting-started/getting-access-to-the-twitter-api}
}
\author{
Ling Xiang, Zou
}

\examples{
Sys.setenv(key = 'xxxxxxxxxxxxxxxxx')
Sys.setenv(secret = 'xxxxxxxxxxxxxxxxxxx')

get_bearer()

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
