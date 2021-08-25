cp .env.sample .env
docker-compose -f docker-compose.yml -f docker-compose.build.yml build --parallel
docker-compose up -d db
docker-compose run frontend npm install
docker-compose run backend python apps/manage.py migrate
