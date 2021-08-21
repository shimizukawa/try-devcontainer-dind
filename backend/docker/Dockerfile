FROM python:3.9-slim
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
WORKDIR /backend
RUN apt-get -y update -q \
    && apt-get install --no-install-recommends -y build-essential libpq5 libpq-dev git
COPY requirements ./requirements
RUN pip3 install -r ./requirements/base.txt
RUN pip3 install -r ./requirements/dev.txt