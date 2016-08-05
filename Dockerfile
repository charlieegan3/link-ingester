FROM ruby:latest

WORKDIR /app

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN bundle install

ADD . /app

CMD bundle exec rails s -b 0.0.0.0 -p 3000
