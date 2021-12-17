
SciViews::R


#Import des données
hops <- read("data/Final.xlsx")

#Remaniement des données
hops %>.%
  gather(., "Low-Ot", "High-Ot", key = "Rate", value = "other") %>.%
  gather(., "Low-Co", "High-Co", key = "Rate", value = "cohumulone") %>.%
  gather(., "Low-b", "High-b", key = "Rate", value = "beta") %>.%
  gather(., "Low-oil", "High-oil", key = "Rate", value = "oil") %>.%
  gather(., "Low-Myr", "High-Myr", key = "Rate", value = "myrcene") %>.%
  gather(., "Low-Cary", "High-Cary", key = "Rate", value = "caryophylene") %>.%
  gather(., "Low-Far", "High-Far", key = "Rate", value = "farnesene") %>.%
  gather(., "Low-H", "High-H", key = "Rate", value = "humulene") %>.%
  gather(., "Low", "High", key = "Rate", value = "alpha") -> hops

#Sélection d'une copie de taux bas-haut
hops <- slice(hops, (1:310),(158409:158720))

#Labels
hops <- labelise(hops, self = FALSE,
  label = list(
    alpha    = "Alpha Acid",
    cohumulone   = "Co-humulone",
    beta = "Beta Acid",
    oil = "Total Oil",
    myrcene = "Myrcene",
    caryophylene = "Caryophylene",
    farnesene = "Farnesene",
    humulene = "Humulene",
    other = "other",
    HSI = "Hop Storage Index"
  ),
  units = list(
    alpha    = "%",
    cohumulone   = "%",
    beta = "%",
    oil = "ml/100g",
    myrcene = "%",
    caryophylene = "%",
    farnesene = "%",
    humulene = "%",
    other = "%",
    HSI = "%"
  )
)

#Copie en locale
write$rds(hops, file = "hops.rds", compress = "gz")

