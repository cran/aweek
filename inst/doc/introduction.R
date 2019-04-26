## ----date2week-----------------------------------------------------------
library("aweek")

set.seed(2019-03-03)
dat <- as.Date("2019-03-03") + sample(-6:7, 10, replace = TRUE)
dat
# Use character days
print(w <- date2week(dat, week_start = "Sunday"))
# Use ISO 8601 days
print(w <- date2week(dat, week_start = 7))

## ----date2week2date------------------------------------------------------
week2date(w)

## ----aweek---------------------------------------------------------------
x <- "2019-W10-1"
attr(x, "week_start") <- 7 # Sunday 
class(x) <- "aweek"
x
class(x)

## ----ascharacter---------------------------------------------------------
as.character(x)

## ----date2week_floor-----------------------------------------------------
print(wf <- date2week(dat, week_start = "Saturday", floor_day = TRUE))
table(wf)

## ----date2week_floor2date------------------------------------------------
print(dwf <- week2date(wf))
weekdays(dwf)

## ----factors-------------------------------------------------------------
dat[1] + c(0, 15)
date2week(dat[1] + c(0, 15), week_start = 1, factor = TRUE, floor_day = TRUE)

## ----week2week, R.options=list(width = 100)-------------------------------------------------------
w # week starting on Sunday
date2week(w, week_start = "wednesday")

# create a table with all days in the week
d <- dat[1] + 0:6
res <- as.data.frame(matrix("", nrow = 7, ncol = 7), stringsAsFactors = FALSE)
names(res) <- weekdays(d) # days of the week
for (i in names(res)) res[[i]] <- date2week(d, week_start = i)
res

## ----week2week2date------------------------------------------------------
data.frame(lapply(res, as.Date))

## ----cweek2week----------------------------------------------------------
c(res$Sunday[1], res$Wednesday[2], res$Friday[3])
c(res$Tuesday[1], res$Thursday[2], res$Friday[3])

## ----add_dates-----------------------------------------------------------
c(res$Monday, as.Date("2019-04-03"))

## ----add_chars-----------------------------------------------------------
s <- c(res$Saturday, "2019-W14-3")
s
m <- c(res$Monday, "2019-W14-3")
m

## ----char2date-----------------------------------------------------------
as.Date(s[7:8])
as.Date(m[7:8])

## ----week2date-----------------------------------------------------------
week2date("2019-W10-1", week_start = "Sunday") # 2019-03-03
week2date("2019-W10-1", week_start = "Monday") # 2019-03-04

## ----week2date_aweek-----------------------------------------------------
week2date(w)

## ----asdate--------------------------------------------------------------
as.Date(w)
as.POSIXlt(w)

