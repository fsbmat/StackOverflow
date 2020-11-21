rm(list = ls())
cat("\014")
library(tidyverse)
library(plotly)

tres <- readRDS(url("https://rawcdn.githack.com/fsbmat/StackOverflow/b4fbf2fe0a59555a2cf77776ab9454a4fb06ba83/tres.rds"))

library(png)
ouro <- png::readPNG('~/GitHub/StackOverflow/Figs/Ouro.png')
prata <- png::readPNG('~/GitHub/StackOverflow/Figs/Prata.png')
bronze <- png::readPNG('~/GitHub/StackOverflow/Figs/Bronze.png')

# plot <- tres %>% ggplot(aes(Time, Pontos, 
#                             fill=Time, 
#                             text=paste("Time:", Time, "<br>", 
#                                        "Pontuação: ", Pontos)))+
#   geom_col(show.legend = FALSE)+
#   theme_bw()+
#   geom_text(aes(label=Pontos),nudge_y = 2)+
#   annotation_raster(ouro, ymin = 75,ymax= 90.1,xmin = 0.75,xmax = 1.25)+
#   annotation_raster(prata, ymin = 59,ymax= 74.1,xmin = 1.75,xmax = 2.25)+
#   annotation_raster(bronze, ymin = 59,ymax= 74.1,xmin = 2.75,xmax = 3.25)


plot <- tres %>% ggplot(aes(Time, Pontos, 
                            fill=Time, 
                            text=paste("Time:", Time, "<br>", 
                                       "Pontuação: ", Pontos)))+
  geom_col(show.legend = FALSE)+
  theme_bw()+
  geom_text(aes(label=Pontos),nudge_y = 2)

ggplotly(plot, tooltip = "text", width = 600, height = 600)%>% 
  layout(images = list(list(
    source = raster2uri(as.raster(ouro)),
    x = 0.75, y = 75, 
    sizex = 0.5, sizey = 15.1,
    xref = "x", yref = "y",
    xanchor = "left", yanchor = "bottom",
    sizing = "stretch"
  ), list(
    source = raster2uri(as.raster(prata)),
    x = 1.75, y = 59, 
    sizex = 0.5, sizey = 15.1,
    xref = "x", yref = "y",
    xanchor = "left", yanchor = "bottom",
    sizing = "stretch"
  ), list(
    source = raster2uri(as.raster(bronze)),
    x = 2.75, y = 59, 
    sizex = 0.5, sizey = 15.1,
    xref = "x", yref = "y",
    xanchor = "left", yanchor = "bottom",
    sizing = "stretch"
  )),
    showlegend = FALSE, 
         title = list(text = paste0('Os três primeiros colocados',
                                    '<br>',
                                    '<sup>',
                                    'Campeonato Brasileiro de 2019',
                                    '</sup>')), 
         margin=0) %>%
  style(textposition = "top")




pen <- png::readPNG("~/GitHub/StackOverflow/Figs/Ouro.png")

plot_ly() %>%
  layout(
    images = list(
      source = raster2uri(as.raster(pen)),
      x = 2, y = 2, 
      sizex = 2, sizey = 1,
      xref = "x", yref = "y",
      xanchor = "left", yanchor = "bottom",
      sizing = "stretch"
    )
  )
