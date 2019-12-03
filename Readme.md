
# Spark Docker
Instructions on building and running the Spark Docker image could be found in the original blog post, [here].

## Running a Standalone Spark cluster using Docker-compose
1. Build the image ```docker-compose build```
2. Start up a Spark master and n slaves ```docker-compose up -d && docker-compose scale slave=n```; change n with the number of required slaves.
3. check the created network by compose ```docker network ls``` and use the docker commands to run a spark-driver or an interactive spark-shell on top of the cluster as following :
   
   
   
4. to destroy the cluster ```docker-compose down```
