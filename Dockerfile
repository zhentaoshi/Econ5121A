FROM rocker/rstudio:latest

# download the repo to local
ADD Econ5121A /home/rstudio/Econ5121A

Run R -e "install.packages(c('plyr', 'plm'), dependencies=TRUE, repos='http://cran.rstudio.com/')"

