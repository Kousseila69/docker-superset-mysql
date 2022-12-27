# VERSION 1.0 (apache-superset version:2.0.1rc6)
# AUTHOR: OUAGUENI Kousseila <ouaguenikousseilar@gmail.com>
# DESCRIPTION: docker apache superset container
# BUILD: docker build --rm -t docker-apache-superset:0.28.1 -f docker-files/DockerFile .
# Modified/revamped version of the https://github.com/apache/incubator-superset/blob/master/contrib/docker/Dockerfile
#########################################################################################################################################################################################################################################
#########################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################

FROM apache/superset
# Switching to root to install the required packages
USER root
# Example: installing the MySQL driver to connect to the metadata database
# if you prefer Postgres, you may want to use `psycopg2-binary` instead
RUN pip install mysqlclient
# Example: installing a driver to connect to Redshift
# Find which driver you need based on the analytics database
# you want to connect to here:
# https://superset.apache.org/installation.html#database-dependencies
RUN pip install sqlalchemy-redshift
# Switching back to using the `superset` user
USER superset
FROM python:3.6
# Build argument[version of apache-superset to be build: pass value while building image]
# Argument de construction [version d’apache-superset à construire : passage de valeur lors de la construction d’image] 
ARG SUPERSET_VERSION

#ARG SUPERSET_VERSION

ENV SUPERSET_HOME=/home/superset/

MAINTAINER Kousseila OUAGUENI <ouaguenikousseila@gmail.com>

RUN groupadd -g 5006 superset
RUN useradd --create-home --no-log-init --uid 5004 --gid 5006 --home ${SUPERSET_HOME} --shell /bin/bash superset
# Configure environment
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8
RUN pip install pyodc
#RUN pip install --option="--prefix=$SUPERSET_HOME" superset==$SUPERSET_VERSION

RUN apt-get update -y
# Install dependencies to fix `curl https support error` and `elaying package conf>
RUN apt-get install -y apt-transport-https apt-utils

# Install common useful packages
RUN apt-get install -y vim less curl netcat postgresql-client default-mysql-client redis-tools

#docker build was failing because of cryptography package failure wirl libssl-dev.
#instead of libssl-dev it is not set to `libssl1.0-dev`
RUN apt-get update -y && apt-get install -y build-essential libssl-dev \
    libffi-dev python3-dev libsasl2-dev libldap2-dev libxi-dev

# Install nodejs for custom build
# https://github.com/apache/incubator-superset/blob/master/docs/installation.rst#m>
# https://nodejs.org/en/download/package-manager/
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
 ######### Méthode 2
#FROM python:3.6
#MAINTAINER OUAGUENI KOUSSEILA <OUAGUENIKOUSSEILA@GMAIL.com>
#########
# Build argument[version of apache-superset to be build: pass value while building image]
# Argument de construction [version d’apache-superset à construire : passage de valeur lors de la construction d’image] 
#ARG SUPERSET_VERSION

#ENV SUPERSET_HOME=/home/superset/
#ENV SUPERSET_DOWNLOAD_URL=https://dist.apache.org/repos/dist/dev/superset/0.32.0rc2/apache-superset-0.32.0rc2-source.tar.gz

# Add a normal superset group & user
# Change group & user id as per your requirement.
#RUN groupadd -g 5006 superset
#RUN useradd --create-home --no-log-init --uid 5004 --gid 5006 --home ${SUPERSET_HOME} --shell /bin/bash superset

# Configure environment
#ENV LANG=C.UTF-8 \
 #   LC_ALL=C.UTF-8

#RUN apt-get update -y
# Install dependencies to fix `curl https support error` and `elaying package configuration warning`
#RUN apt-get install -y apt-transport-https apt-utils

# Install common useful packages
#RUN apt-get install -y vim less curl netcat postgresql-client default-mysql-client redis-tools





#RUN mkdir -p /home/superset/.cache
#RUN mkdir -p /home/superset/config
#RUN pip install --upgrade setuptools pip
#RUN pip install -r requirements.txt
#RUN pip install -r requirements-dev.txt
#RUN pip install -e .



#COPY docker-files/database-dependencies.txt .
#RUN pip install -r database-dependencies.txt
# copy superset_condfig.py file
#COPY config/superset_config.py ${SUPERSET_HOME}config/

#RUN chown -R superset:superset $SUPERSET_HOME

#USER superset

#RUN cd superset/assets && yarn
#RUN cd superset-frontend && npm ci && npm run build && rm -rf node_modules

HEALTHCHECK CMD ["curl", "-f", "http://localhost:8088/health"]
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 8088 5555
#############################################  DOCKER FILE MASTER BI&A 2022/2023 BY KOUKOU     ################################
