# Reference: https://www.edureka.co/blog/ggplot2-tutorial/
library(ggplot2)
library(statisticalModeling)
head(Birth_weight)
str(Birth_weight)
# plot 1 simple bar-plot showing distribution of baby's weight
ggplot(data=Birth_weight, aes(x=baby_wt))+geom_bar()
# plot 2 simple bar-plot
ggplot(data=Birth_weight, aes(x=mother_age))+geom_bar()
# plot 3 colored bar-plot
ggplot(data = Birth_weight,aes(x=mother_age))+geom_bar(fill="aquamarine4")
# plot 4 bar-plot (color variation w.r.t. income levels)
ggplot(data=Birth_weight, aes(x=mother_age, fill=income))+geom_bar()
# plot 5 inverted bar-plot
ggplot(data=Birth_weight, aes(x=mother_age, fill=income))+geom_bar()+coord_flip()
head(mtcars)
# plot 6 bar-plot
ggplot(data=mtcars,aes(x=cyl,fill=factor(gear)))+geom_bar()
# plot 7 bar-plot (variation in terms of proportion)
ggplot(data=mtcars,aes(x=cyl,fill=factor(gear)))+geom_bar(position="fill")
# plot 8 bar-plot (dodge comparison)
ggplot(data=mtcars,aes(x=cyl,fill=factor(gear)))+geom_bar(position = "dodge")
# plot 9 bar-plot (facelet division)
ggplot(data=Birth_weight, aes(x=mother_age,fill=smoke))+geom_bar()+facet_grid(. ~smoke)
# plot 10 scatter-plot
ggplot(data=mtcars,aes(x=mpg, y=hp, col=factor(cyl)))+geom_point()
# plot 11 scatter-plot (size variation)
ggplot(data=mtcars,aes(x=mpg,y=hp,col=factor(cyl),size=factor(gear)))+geom_point()+labs(size="gear",col="cyl")
# plot 12 box plot
ggplot(data=Birth_weight, aes(x=smoke,y=baby_wt,fill=income))+geom_boxplot()
# plot 13 line plot
ggplot(data=Birth_weight,aes(x=mother_wt,y=baby_wt))+geom_smooth()
# plot 14 line plot (comparison of 2 line curves)
ggplot(data=Birth_weight,aes(x=mother_wt,y=baby_wt,col=smoke))+geom_smooth()
# plot 15 jitter-plot
ggplot(data = Birth_weight,aes(x=smoke,y=baby_wt,col=smoke))+geom_jitter()

