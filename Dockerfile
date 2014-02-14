FROM ubuntu:saucy

RUN apt-get -qq update
RUN apt-get install -y ruby ruby-dev build-essential
RUN gem install rubygems-update
RUN update_rubygems
RUN gem install bundler

RUN mkdir -p /opt/jekyll
WORKDIR /opt/jekyll
ADD Gemfile /opt/jekyll/
RUN bundle install
CMD bundle exec jekyll serve
