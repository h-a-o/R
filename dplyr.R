library(nycflights13)
library(dplyr)
library(ggplot2)
dim(flights)
filter(flights, month==1, day==1) # select all flights on January 1st
arrange(flights, year, month, day)
arrange(flights, desc(arr_delay)) # desc() order a column in descending order
select(flights, year, month, day)
select(flights, year:day)
select(flights, -(year:day))
# select()
# starts_with() ends_with() matches() contains()
select(flights, tail_num = tailnum) # rename variables, drop the rest variables
rename(flights, tail_num = tailnum) 
# add new columns with mutate()
mutate(flights, 
       gain = arr_delay - dep_delay,
       speed = distance / air_time * 60)
# only keep the new variable
transmute(flights, 
          gain = arr_delay - dep_delay, 
          speed = distance / air_time * 60)
summarise(flights, 
          delay=mean(dep_delay, na.rm=TRUE)) # summarise values
# randomly sample rows
sample_n(flights, 10)
sample_frac(flights, 0.01)

by_tailnum<-group_by(flights, tailnum)
delay<-summarise(by_tailnum,
                 count = n(),
                 dist = mean(distance, na.rm = TRUE),
                 delay = mean(arr_delay, na.rm = TRUE))
delay<-filter(delay, count>20, dist<2000)
ggplot(delay, aes(dist, delay)) +
  geom_point(aes(size = count), alpha = 1/2) +
  geom_smooth() +
  scale_size_area()
# min(), max(), mean(), sum(), sd(), median(), IQR()
# n() - the number of observations in the current group
# n-distince(x) - the number of unique values in x
# first(x) - x[1], last(x) - x[length(x)], nth(x, n)-x[n] gives u more control if value missing

# find the number of planes and the number of planes that go to each possible destinations
destinations <- group_by(flights, dest)
summarise(destinations, 
          plane = n_distinct(tailnum),
          flights = n())
# group by multiple variables
daily<-group_by(flights, year, month, day)
(per_day   <- summarise(daily, flights = n()))
(per_month <- summarise(per_day, flights = sum(flights)))
(per_year  <- summarise(per_month, flights = sum(flights)))

select(flights, year)
select(flights, 1)
year<-5
select(flights, year)
year<-"dep"
select(flights, starts_with(year))
year<-5
select(flights, year, identity(year))
vars<-c("year", "month")
select(flights, vars, "day")
# safer than above
flights$vars<-flights$year
vars<-c("year", "month", "day")
select(flights, !! vars)

# mutating opeartions
df<-select(flights, year:dep_time)
mutate(df, year+10)

# piping
a1<-group_by(flights, year, month, day)
a2<-select(a1, arr_delay, dep_delay)
a3<-summarise(a2,
              arr=mean(arr_delay, na.rm=TRUE),
              dep=mean(dep_delay, na.rm=TRUE))
a4<-filter(a3, arr>30|dep>30)
flights %>%
  group_by(year, month, day) %>%
  select(arr_delay, dep_delay) %>%
  summarise(
    arr = mean(arr_delay, na.rm = TRUE),
    dep = mean(dep_delay, na.rm = TRUE)
  ) %>%
  filter(arr > 30 | dep > 30)
