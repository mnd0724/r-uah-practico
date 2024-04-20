# 1. Exploración inicial ----
pacman::p_load(dplyr, sjmisc, car, sjlabelled, stargazer, haven, tidyverse)
rm(list=ls())       # borrar todos los objetos en el espacio de trabajo
options(scipen=999) # valores sin notación científica
datos <- read_excel("input/base.xlsx", sheet = "areaverde-hab")
view(datos)
dim(datos)

# 2. Selección de variables ----
proc_data <- datos %>% select(Comuna,
                                            `Superficie de Área Verde (m2)`, 
                                            `Superficie Plazas (m2)`, 
                                            `BPU_29 Superficie de Área Verde por Habitantes (m2/Hab)`,
                              Región,
                              Cod_Ciudad) 

## 2. 1 Comprobar ----
names(proc_data)

sjlabelled::get_label(proc_data) #Observar las etiquetas de las variables
view(proc_data) #Ver data procesada 
proc_data <- proc_data %>% dplyr::filter(Cod_Ciudad==13001) #Filtrar por región (metropolitana)

# PROCESAMIENTO ----- 
frq(proc_data$`Superficie de Área Verde (m2)`)
