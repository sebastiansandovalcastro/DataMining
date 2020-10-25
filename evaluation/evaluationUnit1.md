# EVALUATION UNIT 1

<div align="center">

**TECNOLÓGICO NACIONAL DE MÉXIO**

INSTITUTO TECNOLÓGICO DE TIJUANA

SUBDIRECCIÓN ACADÉMICA
 
DEPARTAMENTO DE SISTEMAS Y COMPUTACIÓN
 
SEMESTRE SEPTIEMBRE 2020 – ENERO 2021

INGENIERÍA EN SISTEMAS COMPUTACIONALES

 
 [![](https://upload.wikimedia.org/wikipedia/commons/2/2e/ITT.jpg)](https://upload.wikimedia.org/wikipedia/commons/2/2e/ITT.jpg)

**MASTER**

JOSÉ CHRISTIAN ROMERO HERNÁNDEZ

**CLASS**

DATA MINING
BDD-1703 SC9A, L - V 17:00 - 18:00 (91L4/Q102)


**EVALUATION UNIT 1**


**STUDENT**

MARTINEZ FLORES PAMELA STEPHANY	16212034

SANDOVAL CASTRO SEBASTIÁN	16212076


Tijuana, Baja California, october 28, 2020.

</div>

## INSTRUCTIONS
The worldwide bank was very impressed with your previous work and they have another project for you.

- You must generate a scatter-plot that shows the statistics of the life expectancy (y axe) and the fertility rate (x axe) by country.

- The scatter-plot must be clasified by country region too.

- They gave you data from 1960 and 2013, and they need you to produce a visualization for each of this years.

- You need to work all the given data in R for future audit.

They ask you too for an observation comparing both periods (the explanation of your results).

## DEVELOPMENT

### NECESSARY PACKAGES

We started importing this two necessary packages, the first one focused on the plotting tasks and the second one focused on the filter cases.

	#IMPORTING PACKAGES
	install.packages("ggplot2")
	install.packages("dplyr")

### FIRST DATA FRAME (CSV FILE)

Here, We used the *read.csv()* function in order to choose the given file "DataFramesEvaluation_Data.csv" and save it in the new data frame called "dataCSV".

	#FIRST DATA FRAME-----------------------------------------------------------

	#CSV Importation.
	dataCSV <- read.csv(file.choose())

Once we stored the the CSV data, We filtered the data frame by year and divided it in two brand new data frames to work in the future with them. We created the new data frames "data1960CSV" and "data2013CSV" as result of the filter process.

	#Filter CSV in 1960 data.
	data1960CSV <- filter(dataCSV, Year == 1960)
	data1960CSV

	#Filter CSV in 2013 data.
	data2013CSV <- filter(dataCSV, Year== 2013)
	data2013CSV

### SECOND AND THIRD DATA FRAME (FROM THE VECTOR)

For this section, We imported the given vectors with additional information necessary to complement the data frame.

We decided to divide the information in 1960 data and 2013 data, thinking on the easy way to work with them in the future.

We erase the vectors at the end because they became unnecessary once the data frames were created.

	#SECOND AND THIRD DATA FRAME------------------------------------------

	#Given vectors importation.
	Country_Code <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","WSM","YEM","ZAF","COD","ZMB","ZWE")
	
	Life_Expectancy_At_Birth_1960 <- c(65.5693658536586,32.328512195122,32.9848292682927,62.2543658536585,52.2432195121951,65.2155365853659,65.8634634146342,61.7827317073171,70.8170731707317,68.5856097560976,60.836243902439,41.2360487804878,69.7019512195122,37.2782682926829,34.4779024390244,45.8293170731707,69.2475609756098,52.0893658536585,62.7290487804878,60.2762195121951,67.7080975609756,59.9613658536585,42.1183170731707,54.2054634146342,60.7380487804878,62.5003658536585,32.3593658536585,50.5477317073171,36.4826341463415,71.1331707317073,71.3134146341463,57.4582926829268,43.4658048780488,36.8724146341463,41.523756097561,48.5816341463415,56.716756097561,41.4424390243903,48.8564146341463,60.5761951219512,63.9046585365854,69.5939268292683,70.3487804878049,69.3129512195122,44.0212682926829,72.1765853658537,51.8452682926829,46.1351219512195,53.215,48.0137073170732,37.3629024390244,69.1092682926829,67.9059756097561,38.4057073170732,68.819756097561,55.9584878048781,69.8682926829268,57.5865853658537,39.5701219512195,71.1268292682927,63.4318536585366,45.8314634146342,34.8863902439024,32.0422195121951,37.8404390243902,36.7330487804878,68.1639024390244,59.8159268292683,45.5316341463415,61.2263414634146,60.2787317073171,66.9997073170732,46.2883170731707,64.6086585365854,42.1000975609756,68.0031707317073,48.6403170731707,41.1719512195122,69.691756097561,44.945512195122,48.0306829268293,73.4286585365854,69.1239024390244,64.1918292682927,52.6852682926829,67.6660975609756,58.3675853658537,46.3624146341463,56.1280731707317,41.2320243902439,49.2159756097561,53.0013170731707,60.3479512195122,43.2044634146342,63.2801219512195,34.7831707317073,42.6411951219512,57.303756097561,59.7471463414634,46.5107073170732,69.8473170731707,68.4463902439024,69.7868292682927,64.6609268292683,48.4466341463415,61.8127804878049,39.9746829268293,37.2686341463415,57.0656341463415,60.6228048780488,28.2116097560976,67.6017804878049,42.7363902439024,63.7056097560976,48.3688048780488,35.0037073170732,43.4830975609756,58.7452195121951,37.7736341463415,59.4753414634146,46.8803902439024,58.6390243902439,35.5150487804878,37.1829512195122,46.9988292682927,73.3926829268293,73.549756097561,35.1708292682927,71.2365853658537,42.6670731707317,45.2904634146342,60.8817073170732,47.6915853658537,57.8119268292683,38.462243902439,67.6804878048781,68.7196097560976,62.8089268292683,63.7937073170732,56.3570487804878,61.2060731707317,65.6424390243903,66.0552926829268,42.2492926829268,45.6662682926829,48.1876341463415,38.206,65.6598292682927,49.3817073170732,30.3315365853659,49.9479268292683,36.9658780487805,31.6767073170732,50.4513658536585,59.6801219512195,69.9759268292683,68.9780487804878,73.0056097560976,44.2337804878049,52.768243902439,38.0161219512195,40.2728292682927,54.6993170731707,56.1535365853659,54.4586829268293,33.7271219512195,61.3645365853659,62.6575853658537,42.009756097561,45.3844146341463,43.6538780487805,43.9835609756098,68.2995365853659,67.8963902439025,69.7707317073171,58.8855365853659,57.7238780487805,59.2851219512195,63.7302195121951,59.0670243902439,46.4874878048781,49.969512195122,34.3638048780488,49.0362926829268,41.0180487804878,45.1098048780488,51.5424634146342)
	
	Life_Expectancy_At_Birth_2013 <- c(75.3286585365854,60.0282682926829,51.8661707317073,77.537243902439,77.1956341463415,75.9860975609756,74.5613658536585,75.7786585365854,82.1975609756098,80.890243902439,70.6931463414634,56.2516097560976,80.3853658536585,59.3120243902439,58.2406341463415,71.245243902439,74.4658536585366,76.5459512195122,75.0735365853659,76.2769268292683,72.4707317073171,69.9820487804878,67.9134390243903,74.1224390243903,75.3339512195122,78.5466585365854,69.1029268292683,64.3608048780488,49.8798780487805,81.4011219512195,82.7487804878049,81.1979268292683,75.3530243902439,51.2084634146342,55.0418048780488,61.6663902439024,73.8097317073171,62.9321707317073,72.9723658536585,79.2252195121951,79.2563902439025,79.9497804878049,78.2780487804878,81.0439024390244,61.6864634146342,80.3024390243903,73.3199024390244,74.5689512195122,75.648512195122,70.9257804878049,63.1778780487805,82.4268292682927,76.4243902439025,63.4421951219512,80.8317073170732,69.9179268292683,81.9682926829268,68.9733902439024,63.8435853658537,80.9560975609756,74.079512195122,61.1420731707317,58.216487804878,59.9992682926829,54.8384146341464,57.2908292682927,80.6341463414634,73.1935609756098,71.4863902439024,78.872512195122,66.3100243902439,83.8317073170732,72.9428536585366,77.1268292682927,62.4011463414634,75.2682926829268,68.7046097560976,67.6604146341463,81.0439024390244,75.1259756097561,69.4716829268293,83.1170731707317,82.290243902439,73.4689268292683,73.9014146341463,83.3319512195122,70.45,60.9537804878049,70.2024390243902,67.7720487804878,65.7665853658537,81.459756097561,74.462756097561,65.687243902439,80.1288780487805,60.5203902439024,71.6576829268293,74.9127073170732,74.2402926829268,49.3314634146342,74.1634146341464,81.7975609756098,73.9804878048781,80.3391463414634,73.7090487804878,68.811512195122,64.6739024390244,76.6026097560976,76.5326585365854,75.1870487804878,57.5351951219512,80.7463414634146,65.6540975609756,74.7583658536585,69.0618048780488,54.641512195122,62.8027073170732,74.46,61.466,74.567512195122,64.3438780487805,77.1219512195122,60.8281463414634,52.4421463414634,74.514756097561,81.1048780487805,81.4512195121951,69.222,81.4073170731707,76.8410487804878,65.9636829268293,77.4192195121951,74.2838536585366,68.1315609756097,62.4491707317073,76.8487804878049,78.7111951219512,80.3731707317073,72.7991707317073,76.3340731707317,78.4184878048781,74.4634146341463,71.0731707317073,63.3948292682927,74.1776341463415,63.1670487804878,65.878756097561,82.3463414634146,67.7189268292683,50.3631219512195,72.4981463414634,55.0230243902439,55.2209024390244,66.259512195122,70.99,76.2609756097561,80.2780487804878,81.7048780487805,48.9379268292683,74.7157804878049,51.1914878048781,59.1323658536585,74.2469268292683,69.4001707317073,65.4565609756098,67.5223658536585,72.6403414634147,70.3052926829268,73.6463414634147,75.1759512195122,64.2918292682927,57.7676829268293,71.159512195122,76.8361951219512,78.8414634146341,68.2275853658537,72.8108780487805,74.0744146341464,79.6243902439024,75.756487804878,71.669243902439,73.2503902439024,63.583512195122,56.7365853658537,58.2719268292683,59.2373658536585,55.633)

	#Only the data of 1960.
	data1960 <- data.frame(Code= Country_Code, Life.Expectancy.1960= Life_Expectancy_At_Birth_1960)
	
	#Only the data of 2013.
	data2013 <- data.frame(Code= Country_Code, Life.Expectancy.2013= Life_Expectancy_At_Birth_2013)

	#And We delete the vectors.
	rm(Country_Code,Life_Expectancy_At_Birth_1960,Life_Expectancy_At_Birth_2013)

### MERGES (1960 DATA AND 2013 DATA)

We decided to do two merges. The merge of the 1960 data and the merge of the 2013, because, on this way, the data was going to be way easier of manage.

For the merge of the 1960 data, we used the data frames created from the CSV and the vectors where the year was equal to 1960. We created a merge called "merge1960", result by the union of the data frames "data1960CSV" and "data1960" related by the Country Code on both data frames.

	#MERGES------------------------------------------------------------------------

	#Merge 1960.
	merge1960 <- merge(data1960CSV, data1960, by.x = "Country.Code", by.y = "Code")

For the merge of the 2013 data, we used the data frames created from the CSV and the vectors where the year was equal to 2013. We created a merge called "merge2013", result by the union of the data frames "data2013CSV" and "data2013" related by the Country Code on both data frames.

	#Merge 2013.
	merge2013 <- merge(data2013CSV, data2013, by.x = "Country.Code", by.y = "Code")

### REGIONS WITH COUNTRIES

In this section We realized that, if We wanted to show the countries and divide them by region, we needed to separate them in different data frames in order to avoid the saturation of information at the  time of plotting the data, so We decided to do six new data frames for the countries with 1960 data divided by region. We filtered using the "merge1960" data frame and We used the six different regions on the data.

	#REGIONS WITH COUNTRIES BY YEAR----------------------------------------

	#Countries 1960 by Region
	Africa1960 <- filter(merge1960, Region== "Africa")
	Asia1960 <- filter(merge1960, Region== "Asia")
	Europe1960 <- filter(merge1960, Region== "Europe")
	MiddleEast1960 <- filter(merge1960, Region== "Middle East")
	Oceania1960 <- filter(merge1960, Region== "Oceania")
	TheAmericas1960 <- filter(merge1960, Region== "The Americas")

We did the same thing here, but We used the "merge2013" data frame as source.

	#Countries 2013 by Region
	Africa2013 <- filter(merge2013, Region== "Africa")
	Asia2013 <- filter(merge2013, Region== "Asia")
	Europe2013 <- filter(merge2013, Region== "Europe")
	MiddleEast2013 <- filter(merge2013, Region== "Middle East")
	Oceania2013 <- filter(merge2013, Region== "Oceania")
	TheAmericas2013 <- filter(merge2013, Region== "The Americas")

We ended up with twelve new data frames, with more specific data in them and an easy plotting as result.

### GRAPHS

We decided that We had the necessary to start to plot the data frames and We started saving each plot to interpret the results at the end. We used the same x and y axes for every graph.

#### YEAR GRAPHS BY REGION

The first graphs that We made were:

- The "g1960" with a comparative between the Life Expectancy in 1960 and the fertility rate.

- The "g2013" with a comparative between the Life Expectancy in 2013 and the fertility rate.

Everything was clasified by the Region of the data.

	#GRAPHS------------------------------------

	#Year graphs by region.
	g1960 = qplot(data=merge1960, x=Fertility.Rate, y=Life.Expectancy.1960, color=Region, size=I(1), main="Life Expectancy 1960 VS. Fertility Rate (By Region)")

	g2013 = qplot(data=merge2013, x=Fertility.Rate, y=Life.Expectancy.2013, color=Region, size=I(1), main="Life Expectancy 2013 VS. Fertility Rate (By Region)")

Then, We merge two plots to see all the data together, clasified by region. We named this graph as "g1960.2013.Region".

	g1960.2013.Region = ggplot() +
	  geom_point(data=merge1960, shape=3, aes(x=Fertility.Rate, y=Life.Expectancy.1960, color=Region)) +
	  geom_point(data=merge2013, shape=20, aes(x=Fertility.Rate, y=Life.Expectancy.2013, color=Region))

And then, We merge two plots to see all the data together, clasified by year. We named this graph as "g1960.2013.Year".

	g1960.2013.Year = ggplot() +
	  geom_point(data=merge1960, shape=3, aes(x=Fertility.Rate, y=Life.Expectancy.1960, color=Year)) +
	  geom_point(data=merge2013, shape=20, aes(x=Fertility.Rate, y=Life.Expectancy.2013, color=Year))

#### REGION GRAPHS BY COUNTRY

The region graphs was divided by countries and We did the same thing for every region.

First of all, We did a 1960 data frame for the region, clasified by countries, then We did the same thing with the 2013 data frame.

Next, We created a merge of graphs in order to see both years with all the countries.

Finally, We made a merge of graphs to see all the data of the specific region, clasified by year.

##### AFRICA GRAPHS

	#Africa Graphs.
	gAfrica1960 = qplot(data=Africa1960, x=Fertility.Rate, y=Life.Expectancy.1960, color=Country.Name, size=I(1), main="Life Expectancy 1960 VS. Fertility Rate (In Africa)")
	gAfrica2013 = qplot(data=Africa2013, x=Fertility.Rate, y=Life.Expectancy.2013, color=Country.Name, size=I(1), main="Life Expectancy 2013 VS. Fertility Rate (In Africa)")

	gAfrica1960.2013.Country = ggplot() +
	  geom_point(data=Africa1960, shape=3, aes(x=Fertility.Rate, y=Life.Expectancy.1960, color=Country.Name)) +
	  geom_point(data=Africa2013, shape=20, aes(x=Fertility.Rate, y=Life.Expectancy.2013, color=Country.Name))

	gAfrica1960.2013.Year = ggplot() +
	  geom_point(data=Africa1960, shape=3, aes(x=Fertility.Rate, y=Life.Expectancy.1960, color=Year)) +
	  geom_point(data=Africa2013, shape=20, aes(x=Fertility.Rate, y=Life.Expectancy.2013, color=Year))

##### ASIA GRAPHS

	#Asia Graphs.
	gAsia1960 = qplot(data=Asia1960, x=Fertility.Rate, y=Life.Expectancy.1960, color=Country.Name, size=I(1), main="Life Expectancy 1960 VS. Fertility Rate (In Asia)")
	gAsia2013 = qplot(data=Asia2013, x=Fertility.Rate, y=Life.Expectancy.2013, color=Country.Name, size=I(1), main="Life Expectancy 2013 VS. Fertility Rate (In Asia)")

	gAsia1960.2013.Country = ggplot() +
	  geom_point(data=Asia1960, shape=3, aes(x=Fertility.Rate, y=Life.Expectancy.1960, color=Country.Name)) +
	  geom_point(data=Asia2013, shape=20, aes(x=Fertility.Rate, y=Life.Expectancy.2013, color=Country.Name))

	gAsia1960.2013.Year = ggplot() +
	  geom_point(data=Asia1960, shape=3, aes(x=Fertility.Rate, y=Life.Expectancy.1960, color=Year)) +
	  geom_point(data=Asia2013, shape=20, aes(x=Fertility.Rate, y=Life.Expectancy.2013, color=Year))

##### EUROPE GRAPHS

	#Europe Graphs.
	gEurope1960 = qplot(data=Europe1960, x=Fertility.Rate, y=Life.Expectancy.1960, color=Country.Name, size=I(1), main="Life Expectancy 1960 VS. Fertility Rate (In Europe)")
	gEurope2013 = qplot(data=Europe2013, x=Fertility.Rate, y=Life.Expectancy.2013, color=Country.Name, size=I(1), main="Life Expectancy 2013 VS. Fertility Rate (In Europe)")

	gEurope1960.2013.Country = ggplot() +
	  geom_point(data=Europe1960, shape=3, aes(x=Fertility.Rate, y=Life.Expectancy.1960, color=Country.Name)) +
	  geom_point(data=Europe2013, shape=20, aes(x=Fertility.Rate, y=Life.Expectancy.2013, color=Country.Name))

	gEurope1960.2013.Year = ggplot() +
	  geom_point(data=Europe1960, shape=3, aes(x=Fertility.Rate, y=Life.Expectancy.1960, color=Year)) +
	  geom_point(data=Europe2013, shape=20, aes(x=Fertility.Rate, y=Life.Expectancy.2013, color=Year))

##### MIDDLE EAST GRAPHS

	#Middle East Graphs.
	gMiddleEast1960 = qplot(data=MiddleEast1960, x=Fertility.Rate, y=Life.Expectancy.1960, color=Country.Name, size=I(1), main="Life Expectancy 1960 VS. Fertility Rate (In Middle East)")
	gMiddleEast2013 = qplot(data=MiddleEast2013, x=Fertility.Rate, y=Life.Expectancy.2013, color=Country.Name, size=I(1), main="Life Expectancy 2013 VS. Fertility Rate (In Middle East)")

	gMiddleEast1960.2013.Country = ggplot() +
	  geom_point(data=MiddleEast1960, shape=3, aes(x=Fertility.Rate, y=Life.Expectancy.1960, color=Country.Name)) +
	  geom_point(data=MiddleEast2013, shape=20, aes(x=Fertility.Rate, y=Life.Expectancy.2013, color=Country.Name))

	gMiddleEast1960.2013.Year = ggplot() +
	  geom_point(data=MiddleEast1960, shape=3, aes(x=Fertility.Rate, y=Life.Expectancy.1960, color=Year)) +
	  geom_point(data=MiddleEast2013, shape=20, aes(x=Fertility.Rate, y=Life.Expectancy.2013, color=Year))

##### OCEANIA GRAPHS

	#Oceania Graphs.
	gOceania1960 = qplot(data=Oceania1960, x=Fertility.Rate, y=Life.Expectancy.1960, color=Country.Name, size=I(1), main="Life Expectancy 1960 VS. Fertility Rate (In Oceania)")
	gOceania2013 = qplot(data=Oceania2013, x=Fertility.Rate, y=Life.Expectancy.2013, color=Country.Name, size=I(1), main="Life Expectancy 2013 VS. Fertility Rate (In Oceania)")

	gOceania1960.2013.Country = ggplot() +
	  geom_point(data=Oceania1960, shape=3, aes(x=Fertility.Rate, y=Life.Expectancy.1960, color=Country.Name)) +
	  geom_point(data=Oceania2013, shape=20, aes(x=Fertility.Rate, y=Life.Expectancy.2013, color=Country.Name))

	gOceania1960.2013.Year = ggplot() +
	  geom_point(data=Oceania1960, shape=3, aes(x=Fertility.Rate, y=Life.Expectancy.1960, color=Year)) +
	  geom_point(data=Oceania2013, shape=20, aes(x=Fertility.Rate, y=Life.Expectancy.2013, color=Year))

##### THE AMERICAS GRAPHS

	#The Americas Graphs.
	gTheAmericas1960 = qplot(data=TheAmericas1960, x=Fertility.Rate, y=Life.Expectancy.1960, color=Country.Name, size=I(1), main="Life Expectancy 1960 VS. Fertility Rate (In The Americas)")
	gTheAmericas2013 = qplot(data=TheAmericas2013, x=Fertility.Rate, y=Life.Expectancy.2013, color=Country.Name, size=I(1), main="Life Expectancy 2013 VS. Fertility Rate (In The Americas)")

	gTheAmericas1960.2013.Country = ggplot() +
	  geom_point(data=TheAmericas1960, shape=3, aes(x=Fertility.Rate, y=Life.Expectancy.1960, color=Country.Name)) +
	  geom_point(data=TheAmericas2013, shape=20, aes(x=Fertility.Rate, y=Life.Expectancy.2013, color=Country.Name))

	gTheAmericas1960.2013.Year = ggplot() +
	  geom_point(data=TheAmericas1960, shape=3, aes(x=Fertility.Rate, y=Life.Expectancy.1960, color=Year)) +
	  geom_point(data=TheAmericas2013, shape=20, aes(x=Fertility.Rate, y=Life.Expectancy.2013, color=Year))

### RESULTS

We obtained the next graphs as result:

#### ALL DATA

	#ALL GRAPHS-------------------------------------------------------------------
	g1960

![g1960.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/g1960.png)

	g2013

![g2013.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/g2013.png)

	g1960.2013.Region

![g1960.2013.Region.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/g1960.2013.Region.png)

	g1960.2013.Year

![g1960.2013.Year.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/g1960.2013.Year.png)

`+ = 1960`	`. = 2013`

#### AFRICA

	gAfrica1960

![gAfrica1960.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gAfrica1960.png)

	gAfrica2013

![gAfrica2013.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gAfrica2013.png)

	gAfrica1960.2013.Country

![gAfrica1960.2013.Country.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gAfrica1960.2013.Country.png)

	gAfrica1960.2013.Year

![gAfrica1960.2013.Year.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gAfrica1960.2013.Year.png)

`+ = 1960`	`. = 2013`

#### ASIA

	gAsia1960

![gAsia1960.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gAsia1960.png)

	gAsia2013

![gAsia2013.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gAsia2013.png)

	gAsia1960.2013.Country

![gAsia1960.2013.Country.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gAsia1960.2013.Country.png)

	gAsia1960.2013.Year

![gAsia1960.2013.Year.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gAsia1960.2013.Year.png)

`+ = 1960`	`. = 2013`

#### EUROPE

	gEurope1960

![gEurope1960.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gEurope1960.png)

	gEurope2013

![gEurope2013.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gEurope2013.png)

	gEurope1960.2013.Country

![gEurope1960.2013.Country.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gEurope1960.2013.Country.png)

	gEurope1960.2013.Year

![gEurope1960.2013.Year.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gEurope1960.2013.Year.png)

`+ = 1960`	`. = 2013`

#### MIDDLE EAST

	gMiddleEast1960

![gMiddleEast1960.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gMiddleEast1960.png)

	gMiddleEast2013

![gMiddleEast2013.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gMiddleEast2013.png)

	gMiddleEast1960.2013.Country

![gMiddleEast1960.2013.Country.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gMiddleEast1960.2013.Country.png)

	gMiddleEast1960.2013.Year

![gMiddleEast1960.2013.Year.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gMiddleEast1960.2013.Year.png)

`+ = 1960`	`. = 2013`

#### OCEANIA

	gOceania1960

![gOceania1960.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gOceania1960.png)

	gOceania2013

![gOceania2013.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gOceania2013.png)

	gOceania1960.2013.Country

![gOceania1960.2013.Country.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gOceania1960.2013.Country.png)

	gOceania1960.2013.Year

![gOceania1960.2013.Year.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gOceania1960.2013.Year.png)

`+ = 1960`	`. = 2013`

#### THE AMERICAS

	gTheAmericas1960

![gTheAmericas1960.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gTheAmericas1960.png)

	gTheAmericas2013

![gTheAmericas2013.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gTheAmericas2013.png)

	gTheAmericas1960.2013.Country

![gTheAmericas1960.2013.Country.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gTheAmericas1960.2013.Country.png)

	gTheAmericas1960.2013.Year

![gTheAmericas1960.2013.Year.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/gTheAmericas1960.2013.Year.png)

`+ = 1960`	`. = 2013`

### FINAL EXPLANATION

Summarizing the results We have to say that, first of all, the higher the fertility rate is, the shorter the life expectancy is.

As We can see in the graphs, Europe has been the region with less fertility rate and more life expectancy through the years, and Africa the region with more fertility rate but a lower life expectancy.

We can see too that the life expectancy is greater in 2013 than the life expectancy in 1960, and the fertility rate is lower in 2013 than the fertility rate in 1960.

Asia is a region that improve a lot the life expectancy from 1960 to 2013 and The Americas reduced a lot the fertility rate from 1960 to 2013, meanwhile Africa suffer the lesser changes in comparation of all regions.

![g1960.2013.Region.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/g1960.2013.Region.png)

![g1960.2013.Year.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit1/evaluation/g1960.2013.Year.png)

`+ = 1960`	`. = 2013`