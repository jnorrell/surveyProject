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


# Distrabution 
# Parse and filter data for females
sex_values= c("F")
m <- surveys %>% # created object m
  filter (sex %in% sex_values) # filter for only female sex
pdf("figures/Distrabution of Females for all Genera.pdf") # start saving as pdf
ggplot( m, aes(genus, fill = genus))+ geom_bar() + ggtitle("Distrabution of Females for all Genera") +  theme(axis.text.x=element_blank(), axis.ticks.x=element_blank())
dev.off() # stop saving as pdf


# Relationship 
# Parse and filter data for certain species 
n <- surveys %>%  # created object n
  filter (species== "merriami") %>% # remove all species but merriami
  filter (!is.na (weight)) %>% # filter out NA weight values
  filter (!is.na (hindfoot_length)) # filter out NA hindfoot_length values
pdf("figures/Relationship of Weight and Hindfoot Length in Dipodomys merriami.pdf") # start saving as pdf
ggplot(data = n, aes(x=weight, y= hindfoot_length, color= weight))+ xlab ("Weight (grams)") + ylab ("Hindfoot length (millimeters)")+ ggtitle("Relationship of Weight and Hindfoot Length in Dipodomys merriami" ) + geom_point((aes(size = weight))) + scale_colour_gradient(high = "deeppink1")
dev.off() # stop saving as pdf

# Comparison 
# Parse and filter data females and males
sex_values= c("F" , "M") 
q <- surveys %>% # created object q
  filter (sex %in% sex_values) %>%  # filter for only females and males sex
  filter (genus== "Dipodomys") # filter for only Dipodomys genus
pdf("figures/Comparison of Male and Female Weight for Genus Dipodomys.pdf") # start saving as pdf
ggplot(data= q, aes(x=sex, y= weight, color= species ))  + ggtitle ("Comparison of Male and Female Weight for Genus Dipodomys") + ylab ("Weight (grams)") + geom_boxplot()
dev.off() # stop saving as pdf 
  

# T-test and graph
# Parse and filter data females and males
sex_values= c("F" , "M") 
w <- surveys %>% # created object w
  filter (sex %in% sex_values) %>%  # filter for female and male sex
  filter (species== "spectabilis") %>% # remove all species but pectabilis
  filter (!is.na (weight)) # filter out NA weight values
pdf("figures/Comparison of Male and Female Weight for Dipodomys spectabilis.pdf") # start saving as pdf
ggplot(data= w, aes(x=sex, y= weight, color= sex )) + ggtitle ("Comparison of Male and Female Weight for Dipodomys spectabilis") + ylab ("Weight (grams)") + geom_boxplot(fill= "black")
dev.off() # stop saving as pdf 

# T-test
t.test(weight ~ sex, data=w) # where y1 & y2 are numeric




