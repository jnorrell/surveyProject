## survey project in R

# install and load library
install.packages("dplyr")
install.packages("colorspace")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

# download a file
download.file("http://files.figshare.com/2236372/combined.csv",  "data/portal_data_joined.csv")

# import file
surveys <- read.csv('data/portal_data_joined.csv')



# relationship geom_point(), geom_line()
ggplot(data = surveys, aes(x=weight, y=hindfoot_length)) + geom_point()
ggplot(data = surveys, aes(x=weight, y= hindfoot_length, color= weight)) + geom_point()
ggplot(data = surveys, aes(x=weight, y= hindfoot_length, color= genus)) + geom_point()
ggplot(data = surveys, aes(x=genus, y=hindfoot_length, color= genus)) + geom_point()


# distrabution geom_histogram(), geom_bar()
ggplot(mtcars, aes(factor(cyl)))


# comparrison geom_bar(), geom_boxplot(), geom_line()
ggplot(data=yearly_counts, aes(x=year, y=n, group=species_id)) + geom_line()
ggplot(data=yearly_counts, aes(x=year, y=n, group=species_id)) + geom_line()
ggplot(data = surveys, aes(x=sex, y=hindfoot_length, color= sex)) + geom_boxplot()
ggplot(data = surveys, aes(x=genus, y=hindfoot_length, color= genus)) + geom_boxplot()
ggplot(data = surveys, aes(x=genus, y=hindfoot_length, color= genus)) + geom_boxplot()
ggplot(data = surveys, aes(x=species, y=hindfoot_length, color= species)) + geom_boxplot()

# statistical test


#### example scatterplot
# ggplot(data = surveys, aes(x=sex, y=hindfoot_length, color= sex)) + geom_point()
ggplot(data = surveys, aes(x=weight, y=hindfoot_length)) + geom_point()
ggplot(data = surveys, aes(x=sex, y=hindfoot_length, color= sex)) + geom_point()
ggplot(data = surveys, aes(x=genus, y=hindfoot_length, color= genus)) + geom_point()
ggplot(data = surveys, aes(x=species_id, y=hindfoot_length, color= species_id)) + geom_point()


# example barchart
ggplot(surveys, aes(weight)) + geom_bar()
ggplot(surveys, aes(plot_id)) + geom_bar(fill= "white", colour= "darkgreen" ) + coord_flip()
ggplot(surveys, aes(year)) + geom_bar(fill= "pink", colour= "darkgreen" )
ggplot(surveys, aes()) + geom_bar(fill= "white", colour= "darkgreen" )
ggplot(surveys, aes(plot_id)) + geom_bar()





ggplot(data = surveys, aes(x=year, y=plot_id, color= year)) + geom_point()



# bubble chart

ggplot(surveys, aes(x=sex, y=weight, hindfoot_length, label=genus)+
  geom_point(colour="white", fill="red", shape=21)+ scale_size_area(max_size = 15)+
  scale_x_continuous(name="Murder", limits=c(0,12))+
  scale_y_continuous(name="Population", limits=c(0,1250))+
  geom_text(size=4)+
  theme_bw()


