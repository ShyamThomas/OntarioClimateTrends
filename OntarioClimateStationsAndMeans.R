##This code file is based on canadaHCD package developed by Gavin Simpson and is a beta version that is still under development. 


getwd() #"C:/Users/thoma/Rprojects/OntarioClimateTrend"
# read all stations in file named Ont.Stns.Lat##
ont.stns.lat=read.csv("ont.stations.latwise.csv")
View(ont.stns.lat)
#Split stations by the three broad latitudinal categories
ont.stns.north=subset(ont.stns.lat,ont.stns.lat$LatitudeDD>=50)
ont.stns.south=subset(ont.stns.lat,ont.stns.lat$LatitudeDD<=46)
ont.stns.mid=subset(ont.stns.lat,ont.stns.lat$LatitudeDD>=46 & ont.stns.lat$LatitudeDD<=50)

write.csv(ont.stns.mid, "ont.stns.mid.csv")
write.csv(ont.stns.north, "ont.stns.north.csv")
write.csv(ont.stns.south, "ont.stns.south.csv")

### loaded the beta version of package "CanadaHCD" which reads the climate data
###from the Government of Canada's Historical Climate Data website provides access to 
###hourly, daily, and monthly weather records for stations throughout Canada.

library("devtools", lib.loc="~/R/win-library/3.3")
devtools::install_github("gavinsimpson/canadaHCD")
library("canadaHCD", lib.loc="~/R/win-library/3.3")
library("readr", lib.loc="~/R/win-library/3.3") #reloaded the readr package#

find_station("PETAWAWA") # a trial run with a random station name

###Showing codes for one selected a station - Kenora from 'ont.stns.mid' datafile, which has most complete data (1970-2015)###
kenora= hcd_monthly(3960) #station_id
kenora.means=kenora[,c(1,2,5,10)] #select only required columns, temp, percipitation, & Date
class(kenora.means)
kenora.means.df=as.data.frame(kenora.means)
head(kenora.means.df)
str(kenora.means.df)
kenora.means.df$Year=as.numeric(format(kenora.means.df$Date, "%Y")) #Create a column called Year from Date column
tail(kenora.means.df$Year)
str(kenora.means.df)
head(kenora.means.df)
write.csv(kenora.means.df, "kenora.means.49.79lat.csv")  ##finally saved it as a csv file with station latitude as
###last part of the file name 

###This was repeated for as many stations as possible with complete datasets within Ontario north, mid, and south categories.
