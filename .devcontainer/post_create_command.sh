cp .env.sample .env
docker pull ghcr.io/beproud/try-devcontainer-dind/backend:latest
docker pull ghcr.io/beproud/try-devcontainer-dind/frontend:latest
docker pull ghcr.io/beproud/try-devcontainer-dind/nginx:latest
docker pull postgres:11
docker-compose pull
docker-compose build
docker-compose up -d db
docker-compose run frontend npm install
docker-compose run backend python apps/manage.py migrate
