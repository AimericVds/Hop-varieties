
SciViews::R
hops <- read("Data/hops.rds")
hops_select <- read("data/hops_select.rds")


###Faire gros chaînage

#Chercher les valeures minimales et maximales et créer une table avec seulement Variety et values

hops_sum <- drop_na(hops_select)
hops_sum <- group_by(hops_sum, orga)
hops_sum <- summarise(hops_sum,
  min = min(values),
  max = max(values))
knitr::kable(hops_sum)


# ACIDES ALPHA

##Création d'une table avec Variety et values existantes
tab1_alpha <- filter(hops_select, orga == "alpha")
tab1_alpha <- select(tab1_alpha, Variety, values)

## Création d'une table avec Variety (X car n'existe pas) et values de 1-28 (min/max)
tab2_alpha <- seq(from = 0, to = 23, by = 1)
tab2_alpha <-data.frame(
  values = tab2_alpha)
tab2_alpha <- mutate(tab2_alpha,
  "Variety" = "Xalpha")

## Fusion des tableaux en éliminants les valeurs existantes dans la table 2 par la table 1
joined_alpha <- rbind(anti_join(tab2_alpha,tab1_alpha, by = "values"),tab1_alpha)

## Conservation des valeurs qui n'existent pas encore
joined_alpha <- filter(joined_alpha,
  Variety == "Xalpha")

#Ca donne ce qui a jamais été fait mais faut voir aussi pourcentages de ce qui a été fait (genre 45% en dessous 5% trucs ainsi) + combinaison de composés aromatiques jamais faites peut être très stylé (+ avion réaction Rasmont?)


# ACIDES BETA

##Création d'une table avec Variety et values existantes
tab1_beta <- filter(hops_select, orga == "beta")
tab1_beta <- select(tab1_beta, Variety, values)

## Création d'une table avec Variety (X car n'existe pas) et values de 1-28 (min/max)
tab2_beta <- seq(from = 0, to = 15, by = 1)
tab2_beta <-data.frame(
  values = tab2_beta)
tab2_beta <- mutate(tab2_beta,
  "Variety" = "Xbeta")

## Fusion des tableaux en éliminants les valeurs existantes dans la table 2 par la table 1
joined_beta <- rbind(anti_join(tab2_beta,tab1_beta, by = "values"),tab1_beta)

## Conservation des valeurs qui n'existent pas encore
joined_beta <- filter(joined_beta,
  Variety == "Xbeta")


# CARYOPHYLENE

##Création d'une table avec Variety et values existantes
tab1_caryo <- filter(hops_select, orga == "caryophylene")
tab1_caryo <- select(tab1_caryo, Variety, values)

## Création d'une table avec Variety (X car n'existe pas) et values de 1-28 (min/max)
tab2_caryo <- seq(from = 0, to = 15, by = 1)
tab2_caryo <-data.frame(
  values = tab2_caryo)
tab2_caryo <- mutate(tab2_caryo,
  "Variety" = "Xcaryo")

## Fusion des tableaux en éliminants les valeurs existantes dans la table 2 par la table 1
joined_caryo <- rbind(anti_join(tab2_caryo,tab1_caryo, by = "values"),tab1_caryo)

## Conservation des valeurs qui n'existent pas encore
joined_caryo <- filter(joined_caryo,
  Variety == "Xcaryo")


# COHUMULONE

##Création d'une table avec Variety et values existantes
tab1_cohu <- filter(hops_select, orga == "cohumulone")
tab1_cohu <- select(tab1_cohu, Variety, values)

## Création d'une table avec Variety (X car n'existe pas) et values de 1-28 (min/max)
tab2_cohu <- seq(from = 0, to = 60, by = 1)
tab2_cohu <-data.frame(
  values = tab2_cohu)
tab2_cohu <- mutate(tab2_cohu,
  "Variety" = "Xcohu")

## Fusion des tableaux en éliminants les valeurs existantes dans la table 2 par la table 1
joined_cohu <- rbind(anti_join(tab2_cohu,tab1_cohu, by = "values"),tab1_cohu)

## Conservation des valeurs qui n'existent pas encore
joined_cohu <- filter(joined_cohu,
  Variety == "Xcohu")


# FARNESENE

##Création d'une table avec Variety et values existantes
tab1_farn <- filter(hops_select, orga == "farnesene")
tab1_farn <- select(tab1_farn, Variety, values)

## Création d'une table avec Variety (X car n'existe pas) et values de 1-28 (min/max)
tab2_farn <- seq(from = 0, to = 28, by = 1)
tab2_farn <-data.frame(
  values = tab2_farn)
tab2_farn <- mutate(tab2_farn,
  "Variety" = "Xfarn")

## Fusion des tableaux en éliminants les valeurs existantes dans la table 2 par la table 1
joined_farn <- rbind(anti_join(tab2_farn,tab1_farn, by = "values"),tab1_farn)

## Conservation des valeurs qui n'existent pas encore
joined_farn <- filter(joined_farn,
  Variety == "Xfarn")

# HUMULENE

##Création d'une table avec Variety et values existantes
tab1_humu <- filter(hops_select, orga == "humulene")
tab1_humu <- select(tab1_humu, Variety, values)

## Création d'une table avec Variety (X car n'existe pas) et values de 1-28 (min/max)
tab2_humu <- seq(from = 0, to = 58, by = 1)
tab2_humu <-data.frame(
  values = tab2_humu)
tab2_humu <- mutate(tab2_humu,
  "Variety" = "Xhumu")

## Fusion des tableaux en éliminants les valeurs existantes dans la table 2 par la table 1
joined_humu <- rbind(anti_join(tab2_humu,tab1_humu, by = "values"),tab1_humu)

## Conservation des valeurs qui n'existent pas encore
joined_humu <- filter(joined_humu,
  Variety == "Xhumu")

# MYRCENE

##Création d'une table avec Variety et values existantes
tab1_myr <- filter(hops_select, orga == "myrcene")
tab1_myr <- select(tab1_myr, Variety, values)

## Création d'une table avec Variety (X car n'existe pas) et values de 1-28 (min/max)
tab2_myr <- seq(from = 0, to = 75, by = 1)
tab2_myr <-data.frame(
  values = tab2_myr)
tab2_myr <- mutate(tab2_myr,
  "Variety" = "Xmyr")

## Fusion des tableaux en éliminants les valeurs existantes dans la table 2 par la table 1
joined_myr <- rbind(anti_join(tab2_myr,tab1_myr, by = "values"),tab1_myr)

## Conservation des valeurs qui n'existent pas encore
joined_myr <- filter(joined_myr,
  Variety == "Xmyr")


# OIL

##Création d'une table avec Variety et values existantes
tab1_oil <- filter(hops_select, orga == "oil")
tab1_oil <- select(tab1_oil, Variety, values)

## Création d'une table avec Variety (X car n'existe pas) et values de 1-28 (min/max)
tab2_oil <- seq(from = 0, to = 15, by = 1)
tab2_oil <-data.frame(
  values = tab2_oil)
tab2_oil <- mutate(tab2_oil,
  "Variety" = "Xoil")

## Fusion des tableaux en éliminants les valeurs existantes dans la table 2 par la table 1
joined_oil <- rbind(anti_join(tab2_oil,tab1_oil, by = "values"),tab1_oil)

## Conservation des valeurs qui n'existent pas encore
joined_oil <- filter(joined_oil,
  Variety == "Xoil")




# Fusion des tables
unencoded <- bind_rows(joined_alpha, joined_beta, joined_caryo, joined_cohu, joined_farn, joined_humu, joined_myr, joined_oil)

#Copie en locale
write$rds(unencoded, file = "unencoded.rds", compress = "gz")

