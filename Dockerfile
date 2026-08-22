# github pages requires ruby 3.1
FROM ruby:3.1-slim

# build-essential: for building bigdecimal gem
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential git && \
    rm -rf /var/lib/apt/lists/* && \
    gem install --no-document bundler

COPY Gemfile ./

RUN bundle install

WORKDIR /srv/jekyll
EXPOSE 4000 35729