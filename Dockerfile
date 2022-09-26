FROM ruby:3.0.2

ARG URL_API=http://dataservice.accuweather.com/currentconditions/v1
ARG CITY_ID=294021
ARG API_REFERENCE=/historical/24
ARG API_KEY=

ENV API_KEY="${API_KEY}"
ENV CITY_ID="${CITY_ID}"
ENV API_REFERENCE="${API_REFERENCE}"
ENV URL_API="${URL_API}"

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

COPY . ./

CMD ["rails", "server", "-b", "0.0.0.0"]