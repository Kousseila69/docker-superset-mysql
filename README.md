<<<<<<< HEAD
# docker-superset-mysql
Apache-superset  using Mysql DB
=======
########################################################        SUPERSET (APACHE) <===> MySQL       #######################################################################""   
#CREATE AN IMAGES AND RUNNING THIS ONE TO CREATE CONTAINERS   FROM SUPERSET (APACHE) CONNECTING WITH DB MYSQL V 5.7  

# contributors
Kousseila OUAGUENI <https://www.linkedin.com/in/kousseila-ouagueni/>

# docker superset
Repository for building [Docker](https://www.docker.com/) container of [Apache Superset](https://superst.apache.org) &[github superset ](https://github.com/apache/superset/).[docker-compose](https://superset.apache.org/docs/installation/installing-superset-using-docker-compose/)

[<img src="https://cloud.githubusercontent.com/assets/130878/20946612/49a8a25c-bbc0-11e6-8314-10bef902af51.png" alt="Superset" width="500"/>](https://superset.apache.org/)

# Git FLOW 
I used the git flow for this project. The structure of our repository is the following : 
3 branchs and the remote 'master'

![image](https://user-images.githubusercontent.com/48882137/155838038-6d7aebed-8ed0-4f23-a62d-8b4e86679983.png)

## How to run using docker commands
* Through general docker commands -
    * first pull a docker  superset image from [docker-hub](https://hub.docker.com/repository/docker/kousseila/superset-mysql/) using either
        ```shell
        docker pull kousseila/superset-mysql :
        ```    
      or for specific superset version by providing version value    
        ```shell
        docker pull kousseila/superset-mysql:<version-tag>
        ```   
    
    * Copy [superset_config.py](config/superset_config.py), [docker-compose.yml](docker-files/docker-compose.yml), and [.env](docker-files/.env) files. I am considering directory structure like below
        ```
        docker-superset-mysql
             |_ config
             |    |_superset_config.py
             |
             |_docker-files
             |    |_docker-compose.yml
             |    |_.env
             |    |_Dockerfile
        
        ```   

    * using `docker-compose`:
        * starting a superset image as a `superset` container in a **local** mode:
            ```shell
            cd docker-superset-mysql/docker-files/ && docker-compose up -d
            OR  deocker-compose -f docker-compose.yml up -d                   ```

          or for passing some different environment variables values like below
            ```shell
            cd docker-superset-mysql /docker-files/ && SUPERSET_ENV=local SUPERSET_VERSION=<version-tag> docker-compose up -d
            ```           
        
        * starting a superset image as a `superset` container in a **prod** mode:
            ```shell
            cd docker-superset-mysql/docker-files/ && SUPERSET_ENV=prod SUPERSET_VERSION=<version-tag> docker-compose up -d
            ```
            
    * using `docker run`:    
        * starting a superset image as a `server` container:
            ```shell
            cd docker-superset-mysql && docker run -p 8088:8088 -v config:/home/superset/config/ kousseila/superset-mysql:<version-tag> cluster server <superset_metadata_db_url> <redis_url>
            ```        
        * starting a superset image as a `worker` container:
            ```shell
             cd docker-superset && docker run -p 5555:5555 -v config:/home/superset/config/ kousseila/superset-mysql:<version-tag> cluster worker <superset_metadata_db_url> <redis_url>
            ```    
       
    [<img src="docker-superset_execution.png" alt="Superset">](docker-superset_execution.png)   
         
   
   
   
>>>>>>> 987c2c9 (Mise à jour le 27 décembre 2022)
