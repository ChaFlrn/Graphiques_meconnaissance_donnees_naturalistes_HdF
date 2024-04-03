#### Création des graphiques

##### Graphique - figure 23 du rapport #####
cli::cli_h2("Pourcentage de la surface des continuités écologiques en fonction de la trame et du département")

figure_23 <- ggplot2::ggplot(data = tvb_cns_pourcentage_area, 
       aes(x = departement, 
           y = pourcentage, 
           fill = indice_connaissance)) +
  geom_col(position = 'stack') +
  scale_fill_brewer(palette = "YlGn") +
  labs(
    title = "Synthèse du croisement de l'indice de connaissance avec les continuités écologiques",
    subtitle = "Région des Hauts-de-France, de 2012 à 2022, espèces protégées",
    y = "Pourcentage de la surface des continuités écologiques")+
  theme(plot.title = element_text(color = "black",
                                  size = 12, 
                                  face = "bold"),
        axis.title = element_text(color = "black", 
                                  size = 10, 
                                  face = "bold")) +
  theme(legend.position = "bottom",
        legend.text = element_text(size=14),
        legend.title = element_blank()) +
  facet_wrap(~ trame, scale ="free")

ggsave("Output/figure_23.jpeg",
       plot = figure_23,
       width = 11, 
       height = 8)
 


##### Graphique - figure 11 du rapport #####
figure_11 <- ggplot2::ggplot(data = esp_pro_an, 
                             aes(x = annees, 
                                 y = nb_graph)) +
  geom_col(color = "royalblue2", 
           fill = "lightskyblue2") +
  labs(
    title = "Distribution annuelle du nombre d'observations par groupe taxonomique",
    subtitle = "Région des Hauts-de-France, de 2012 à 2022, espèces protégées",
    x = "Année",
    y = "Nombre d'observations (en milliers)") +
  theme(plot.title = element_text(color = "black", size = 12, face = "bold"),
        axis.title = element_text(color = "royalblue2", size = 10)) +
  theme(axis.text.x = element_text(angle = 90)) +
  facet_wrap(~groupe_taxo, scale = "free")



ggsave("Output/figure_11.jpeg",
       plot = figure_11,
       width = 11, 
       height = 8)
