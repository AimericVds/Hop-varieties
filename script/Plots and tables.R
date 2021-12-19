
#Import des données
SciViews::R
hops <- read("Data/hops.rds")


#Tableau HSI + explication HSI
hops_HSI <- select(hops, Variety,HSI)
hops_HSI <- na_if(hops_HSI, "-")
hops_HSI <- drop_na(hops_HSI)
hops_HSI$HSI <- as.numeric(hops_HSI$HSI)
hops_HSI <- summarise(hops_HSI,
  "Mean" = mean(HSI),
  "Minimum" = min(HSI),
  "Maximum" = max(HSI),
  "Median" =median(HSI))
knitr::kable(hops_HSI, digits =2,)



#Graphique occurences pays

## Graphique montrant tous les pays
chart(hops, ~ fct_infreq(Country)) +
  geom_bar() +
  ylab("Effectifs") + xlab("Country")

## Graphique qui montre les pays principaux
hops_freq<- filter(hops,
  Country %in% c("USA", "GER",  "UK", "NZ", "SL", "AUS"))

chart(hops_freq, ~ fct_infreq(Country)) +
  geom_bar() +
  ylab("Effectifs") + xlab("Country")

### Note : montrer continents en %fill=%
### Faire correspondre grands pays producteur houblon/bière avec nombre variétées par pays


#Graphique amertume par pays

hops_select <- read("data/hops_select.rds")

##Graphique pour acides organiques
hops_select1 <- filter(hops_select, orga %in% c("alpha", "beta","cohumulone"))
chart(hops_select1, values ~ orga %fill=% Rate) +
  geom_boxplot()

##Graphique pour autres
hops_select2 <- filter(hops_select, orga %in% c("myrcene", "caryophylene","farnesene", "humulene", "other"))
chart(hops_select2, values ~ orga %fill=% Rate) +
  geom_boxplot()


