FROM rocker/shiny:4.3.2

# Install system dependencies if needed
RUN apt-get update && apt-get install -y libcurl4-openssl-dev

# Install R packages
RUN R -e "install.packages(c('shiny', 'shinydashboard', 'dplyr', 'ggplot2', 'presize'), repos='https://cloud.r-project.org')"

# Copy app files into the container
COPY app.R /srv/shiny-server/
COPY ui /srv/shiny-server/ui
COPY www /srv/shiny-server/www

# Expose Shiny port
EXPOSE 3838

# Run Shiny Server
CMD ["/usr/bin/shiny-server"]



