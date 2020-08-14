FROM circleci/ruby:2.7

RUN curl https://cli-assets.heroku.com/install.sh | sh

COPY --chown=circleci:circleci . /sscce

WORKDIR /sscce

RUN bundle install

CMD bundle exec hatchet ci:setup && bundle exec rspec spec/
