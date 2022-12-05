FROM ruby:3.1.3

RUN apt-get update -qq && apt-get install -y postgresql-client
WORKDIR /blog
COPY ./blog/Gemfile /blog/Gemfile
COPY ./blog/Gemfile.lock /blog/Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
