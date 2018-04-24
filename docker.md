# Docker setup

- create a `Dockerfile` with this content:
```
FROM ruby:2.3.0
ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install -y nodejs \
                       vim \
                       mysql-client \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

#Cache bundle install
WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP_ROOT /workspace
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
COPY . $APP_ROOT

EXPOSE  3000
CMD ["rails", "server", "-b", "0.0.0.0"]
```

- create a `mysql-server` docker container (specify any password):
```
docker run --name mysql-server -e MYSQL_ROOT_PASSWORD=mypass -d mysql:5.6
```

- specify in your `database.yml` the `host`:
```yml
  username: root
  password: <%= Rails.application.secrets.database_password %>
  host: mysqlhost
```

- build the rails docker container from the current folder:
```
docker build -t rails-selection .
```
- run it:
```
docker run -it -p 3000:3000 --name rails-selection --link mysql-server:mysqlhost rails-selection
```

- run the db:setup:
```
docker exec rails-selection rails db:setup
```

- enjoy your dockerified `http://localhost:3000/`
