raindrops <- function(number) {
  ret <- ""
  if (number %% 7 == 0) {ret <- paste("Plong", ret, sep="")}
  if (number %% 5 == 0) {ret <- paste("Plang", ret, sep="")}
  if (number %% 3 == 0) {ret <- paste("Pling", ret, sep="")}
  if (ret == "") {ret = as.character(number)}
  ret
}
