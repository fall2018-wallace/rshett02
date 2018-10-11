
a<- df
#2)	Copy the USArrests dataset into a local variable (similar to HW 2)
b <- USArrests #USAressts dataset is loaded in a local variable
#3)	Create a merged dataframe -- with the attributes from both dataframes
mergeddf <- merge(a, b, by.a = "stateName", by.b ="row.names") #a merged dataset is created 
mergeddf

#Step B: Explore the Data – Understanding distributions

library(ggplot2)

#4)	Create a histogram using GGPLOT for the population and a different histogram for the murder rate
p1 <- ggplot(mergeddf, aes(x=population)) + geom_histogram(bins = 5, color="black", fill="blue")+ labs(x="Population") + ggtitle("HISTOGRAM FOR POPULATION")
#histogram is created for population number of bins are adjusted name on xaxis is changed and colour of histogram is changed
p2<- ggplot(mergeddf, aes(x=Murder)) + geom_histogram(bins = 15,color="black", fill="blue")+ labs(x="Murder")+ ggtitle("HISTOGRAM FOR MURDER")
#histogram is created for murder and number of bins are adjusted name on xaxis is changed and colour of histogram is changed
p3 <- ggplot(mergeddf, aes(x=Assault)) + geom_histogram(bins = 5,color="black", fill="blue")+ labs(x="Assault")+ ggtitle("HISTOGRAM FOR ASSAULT")
#histogram is created for assault and number of bins are adjusted name on xaxis is changed and colour of histogram is changed
p4 <- ggplot(mergeddf, aes(x=Rape)) + geom_histogram(bins = 15,color="black", fill="blue")+ labs(x="Rape")+ ggtitle("HISTOGRAM FOR Rape")
#histogram is created for rape and number of bins are adjusted name on xaxis is changed and colour of histogram is changed
p5 <- ggplot(mergeddf, aes(x=popOver18)) + geom_histogram(bins = 5,color="black", fill="blue")+ labs(x="popOver18")+ ggtitle("HISTOGRAM FOR MURDER")
#histogram is created for popOver18 and number of bins are adjusted name on xaxis is changed and colour of histogram is changed
#5)	Create a boxplot for the population, and a different boxplot for the murder rate.
p6 <- ggplot(mergeddf, aes(x=factor(0),population))+ geom_boxplot() #a boxplot is created for population

ggplot(mergeddf, aes(x=factor(0),Murder))+ geom_boxplot() #a boxplot is created for murder
#6)	Create a block comment explaining which visualization (boxplot or histogram) you thought was more helpful (explain why)
#histogram tends to be more helpful as the distribution is visually more clear whereas it is confusing in boxplot because frequency is not represented
#Step C: Which State had the Most Murders – bar charts
#7)	Calculate the number of murders per state
mergeddf$murdernum <- mergeddf$Murder*mergeddf$population/10000 #number of murders is calculated and added as acolumn
View(mergeddf)

#8)	Generate a bar chart, with the number of murders per state
murderplot <- ggplot(mergeddf, aes(x=stateName, y=murdernum)) #sets the dataset with x and y axis for the graph
murderplot <- murderplot+geom_col() #generates a bar chart on the above
murderplot <- murderplot + ggtitle("Murders per state") #ggtitle adds a title to the graph
murderplot
#9)	Generate a bar chart, with the number of murders per state. Rotate text (on the X axis), so we can see x labels, also add a title named “Total Murders”.
murderplot1 <- ggplot(mergeddf, aes(x=stateName, y=murdernum))
murderplot1 <- murderplot1+geom_col()
murderplot1 <- murderplot1 + ggtitle("TOTAL MURDERS") + theme(axis.text.x= element_text(angle = 90, hjust = 1)) #the theme function is used to change the alignment of the text
murderplot1

#10)	 Generate a new bar chart, the same as in the previous step, but also sort the x-axis by the murder rate
murderplot2 <- ggplot(data = mergeddf, aes(x=reorder(stateName,murdernum), y=murdernum))+geom_col()+ggtitle("Total Murders") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
murderplot2      #the reorder function is used to reorder the x axis based on murder rate                


#11)	 Generate a third bar chart, the same as the previous step, but also showing percentOver18 as the color of the bar
ggplot(data = mergeddf, aes(x=reorder(stateName, Murder), y=murdernum, fill=percentOver18)) + geom_col() + ggtitle("Total Murders") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
#the graph is filled based on percentOver18 data
#12)	Generate a scatter plot – have population on the X axis, the percent over 18 on the y axis, and the size & color represent the murder rate
ggplot(data=mergeddf,aes(x=population,y=percentOver18)) + geom_point(aes(size=Murder,color=Murder))
#the size and colour is based on data of murder

