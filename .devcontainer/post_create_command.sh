cp .env.sample .env \
&& docker-compose pull \
&& docker-compose build \
&& docker-compose run frontend npm install \
&& docker-compose run backend python apps/manage.py migrate
