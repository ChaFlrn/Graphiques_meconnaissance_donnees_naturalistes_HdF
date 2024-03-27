#### Récupération des données et préparation du fichier pour réaliser les graphiques ####

##### Les données #####
cli::cli_h2("Données croisement TVB et indice connaissance, espèces protégées")

data_tvb_cns_pro <- sf::read_sf("Data/tvb_cns.shp")


##### Mise en forme du fichier #####

cli::cli_h2("Sélection des variables utiles")

tvb_cns_propre <- data_tvb_cns_pro %>%
  dplyr::select(trame, 
         id_mall, 
         indc_pr, 
         indc_sp, 
         indc_cn, 
         layer_3, 
         path_3, 
         area)

tvb_cns_propre$area_km = tvb_cns_propre$area / 1000000

# Séparation de la variable layer_3 pour récupérer le département et le groupe taxonomique
tvb_cns_propre <- tvb_cns_propre %>% 
  separate(layer_3,
           c("indice", 
             "connaissance", 
             "dept",
             "pro",
             "groupe_tax"))

tvb_cns_propre <- tvb_cns_propre%>% dplyr::filter(!is.na(dept))

tvb_cns_propre <- tvb_cns_propre %>%
  dplyr::select(trame,
                id_maille = id_mall,
                indice_pression_obs = indc_pr,
                indice_maille = indc_sp,
                indice_connaissance = indc_cn, 
                departement = dept,
                groupe_taxonomique = groupe_tax,
                surface_km = area_km)

tvb_cns_propre <- as.data.frame(tvb_cns_propre)

cli::cli_h2("Calcul des pourcentages de surface par groupe taxonomique, département et trame")

# Somme des surfaces par département, groupe taxonomique, trame et indice connaissance
tvb_cns_pourcentage_area <- tvb_cns_propre %>%
  dplyr::group_by(departement, 
           groupe_taxonomique, 
           indice_connaissance, trame) %>%
  summarise(total_area = sum(surface_km), 
            .groups = "drop")

# Calcul de la surface totale par département et trame
surface_totale <- tvb_cns_pourcentage_area %>%
  dplyr::group_by(departement, trame) %>%
  summarise (total = sum(total_area), 
             .groups = "drop")

# Récupération de la surface totale calculée
tvb_cns_pourcentage_area <- as.data.frame(tvb_cns_pourcentage_area)
surface_totale <- as.data.frame(surface_totale)
tvb_cns_pourcentage_area <- base::merge(tvb_cns_pourcentage_area, 
                                        surface_totale, 
                                        by=c("departement","trame"), 
                                        all.x = TRUE)

# Nettoyage du fichier
tvb_cns_pourcentage_area <- tvb_cns_pourcentage_area %>%
  dplyr::select(trame, 
         groupe_taxonomique, 
         departement, 
         indice_connaissance, 
         total_area, 
         total)

##### Calcul des pourcentages #####
tvb_cns_pourcentage_area$pourcentage = round((tvb_cns_pourcentage_area$total_area / tvb_cns_pourcentage_area$total) * 100, 2)


