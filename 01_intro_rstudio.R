## ----ellmer_demo, eval = FALSE---------------------------------------------------------------------
# install.packages("ellmer")
# 
# library("ellmer")
# chat <- chat_github()
# live_console(chat)
# ## Ejemplo 1: What is my name?
# ## Ejemplo 2: Who created R?
# ## Ejemplo 3: How many Bioconductor packages are there right now?
# ##
# ## Salir con Q


## ----pal_demo, eval = FALSE------------------------------------------------------------------------
# ## Instalar pal
# install.packages("pak")
# pak::pak("simonpcouch/pal")
# 
# ## Probar pal
# library("pal")
# options(
#     .pal_fn = "chat_github"
# )
# pal_roxygen <- .init_pal("roxygen")
# cat(
#     pal_roxygen$chat("foo <- function(hola) {
#         print(hola)
#     }")
# )
# 
# ## En teoria funciona, pero no me ha funcionado a mi
# ## como lo reporté en https://github.com/simonpcouch/pal/issues/79
# rlang::abort("`save_pred` can only be used if the initial results saved predictions.")
# 
# ## Igual con este ejemplo
# foo <- function(hola) {
#     print(hola)
# }


## ----lang_demo, eval = FALSE-----------------------------------------------------------------------
# ## 1. Instala el paquete de mall
# install.packages("mall")
# 
# ## 2. Instala Ollama desde https://ollama.com/download
# 
# ## 3. Instala ollamar
# install.packages("ollamar")
# 
# ## 4. Descarga un LLM, tipo llama3.2
# ollamar::pull("llama3.2")
# 
# ## 5. Instala lang
# install.packages("pak")
# pak::pak("mlverse/lang")
# 
# ## 6. Checa cual es tu lenguaje
# Sys.getenv("LANG")
# ## 6b. Cambia tu lenguaje si quieres
# Sys.setenv(LANGUAGE = "Spanish")
# 
# ## 7. Prueba lang
# library("lang")
# llm_use("ollama", "llama3.2", seed = 100)
# ?lm
# ## 7b. Para hacerlo de forma más permanente edita tu ~/.Rprofile con
# # usethis::edit_r_profile()
# ## y luego agrega
# Sys.setenv(LANGUAGE = "Spanish")
# library("lang")
# llm_use("ollama", "llama3.2", seed = 100)


## ----install_rsthemes, eval = FALSE----------------------------------------------------------------
# remotes::install_github(c(
#     "gadenbuie/rsthemes"
# ))
# remotes::install_cran("suncalc")
# rsthemes::install_rsthemes(include_base16 = TRUE)


## ----r_profile, eval = FALSE-----------------------------------------------------------------------
# usethis::edit_r_profile()
# 
# ## From https://www.garrickadenbuie.com/project/rsthemes/
# if (interactive() && requireNamespace("rsthemes", quietly = TRUE)) {
#     # Set preferred themes if not handled elsewhere..
#     rsthemes::set_theme_light("Solarized Light {rsthemes}") # light theme
#     rsthemes::set_theme_dark("base16 Monokai {rsthemes}") # dark theme
#     rsthemes::set_theme_favorite(c(
#         "Solarized Light {rsthemes}",
#         "base16 Monokai {rsthemes}",
#         "One Dark {rsthemes}"
#     ))
# 
#     # Whenever the R session restarts inside RStudio...
#     setHook("rstudio.sessionInit", function(isNewSession) {
#         # Automatically choose the correct theme based on time of day
#         ## Used rsthemes::geolocate() once
#         rsthemes::use_theme_auto(lat = 39.2891, lon = -76.5583)
#     }, action = "append")
# }
# 
# ## https://blog.rstudio.com/2013/06/10/rstudio-cran-mirror/
# options(repos = c(CRAN = "https://cloud.r-project.org"))


## ----proj, eval = FALSE----------------------------------------------------------------------------
# usethis::create_project("~/Desktop/rnaseq_2025_notas")


## ----create_setup, eval = FALSE--------------------------------------------------------------------
# ## Start a setup file
# usethis::use_r("01-notas.R")


## ----create_01-visualizar-mtcars, eval = FALSE-----------------------------------------------------
# ## Creemos el archivo R/02-visualizar-mtcars.R
# usethis::use_r("02-visualizar-mtcars.R")


## ----vis_mtcars, eval = FALSE----------------------------------------------------------------------
# library("sessioninfo")
# library("here")
# library("ggplot2")
# 
# ## Hello world
# print("Soy Leo")
# 
# ## Directorios
# dir_plots <- here::here("figuras")
# dir_rdata <- here::here("processed-data")
# 
# ## Crear directorio para las figuras y archivos
# dir.create(dir_plots, showWarnings = FALSE)
# dir.create(dir_rdata, showWarnings = FALSE)
# 
# ## Hacer una imagen de ejemplo
# pdf(file.path(dir_plots, "mtcars_gear_vs_mpg.pdf"),
#     useDingbats = FALSE
# )
# ggplot(mtcars, aes(group = gear, y = mpg)) +
#     geom_boxplot()
# dev.off()
# 
# ## Para reproducir mi código
# options(width = 120)
# sessioninfo::session_info()


## ----use_git_init, eval = FALSE--------------------------------------------------------------------
# ## Para poder conectar tu compu con GitHub
# usethis::create_github_token() ## Abrirá una página web, escoje un nombre único
# ## y luego da click en el botón verde al final. Después copia el token
# ## (son 40 caracteres)


## ----gitcreds_set, eval = FALSE--------------------------------------------------------------------
# gitcreds::gitcreds_set() ## Ojo, copia el token, no tu password de git!
# ## Si no, terminaras en la situación descrita en
# ## https://github.com/r-lib/usethis/issues/1347


## ----edit_r_envir, eval = FALSE--------------------------------------------------------------------
# usethis::edit_r_environ()


## ----use_git_cont_parte1, eval = FALSE-------------------------------------------------------------
# ## Configura tu usuario de GitHub
# usethis::edit_git_config()


## ----use_git_cont_parte2, eval = FALSE-------------------------------------------------------------
# ## Para inicializar el repositorio de Git
# usethis::use_git()
# 
# ## Para conectar tu repositorio local de Git con los servidores de GitHub
# usethis::use_github()


## git clone https://github.com/lcolladotor/rnaseq_LCG-UNAM_2025.git
## 
## ## Si tienen su SSH key configurarda pueden usar
## ## Info sobre SSH keys de GitHub:
## ## https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
## git clone git@github.com:lcolladotor/rnaseq_LCG-UNAM_2025.git

## ----clone_repo, eval = FALSE----------------------------------------------------------------------
# ## Opción más nueva:
# library("gert")
# repo <- git_clone(
#     "https://github.com/lcolladotor/rnaseq_LCG-UNAM_2025",
#     "~/Desktop/rnaseq_LCG-UNAM_2025"
# )
# setwd(repo)
# 
# ## Otra opción:
# git2r::clone(
#     "https://github.com/lcolladotor/rnaseq_LCG-UNAM_2025",
#     "~/Desktop/rnaseq_LCG-UNAM_2025"
# )


## ----eval=FALSE------------------------------------------------------------------------------------
# ## Puedes instalar Postcards con el siguiente comando:
# install.packages("postcards")
# 
# ## O puedes instalar la última versión en desarrollo:
# remotes::install_github("seankross/postcards@main")


## ----eval=FALSE------------------------------------------------------------------------------------
# ## Crearun nuevo proyecto
# usethis::create_project("Su_Usuario.github.io")


## ----eval=FALSE------------------------------------------------------------------------------------
# ## Configurar Git y GitHub
# usethis::use_git() # Reiniciar la sesión
# usethis::use_github()


## ----eval=FALSE------------------------------------------------------------------------------------
# ## Elegir solo una plantilla (la que más te guste)
# postcards::create_postcard(template = "jolla")
# postcards::create_postcard(template = "jolla-blue")
# postcards::create_postcard(template = "trestles")
# postcards::create_postcard(template = "onofre")
# postcards::create_postcard(template = "solana")


## ----eval=FALSE------------------------------------------------------------------------------------
# ## Desplegar la página GitHub
# rmarkdown::render("index.Rmd")

