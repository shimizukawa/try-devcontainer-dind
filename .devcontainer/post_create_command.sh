cp .env.sample .env
# HTTP_CERTS is provided by Secrets for this Codespaces 
mkdir -p certs && echo $HTTP_CERTS | base64 -d | tar zxf - -C certs

# setup containers
docker-compose -f docker-compose.yml -f docker-compose.build.yml build --parallel
docker-compose up -d db
docker-compose run frontend npm install
docker-compose run backend python apps/manage.py migrate
