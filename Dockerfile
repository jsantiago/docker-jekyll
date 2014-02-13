FROM ubuntu:saucy

RUN apt-get -qq update
RUN apt-get install -y ruby ruby-dev build-essential
RUN gem install rubygems-update
RUN update_rubygems
RUN gem install bundler

RUN mkdir -p /home/jekyll
WORKDIR /home/jekyll
ADD Gemfile /home/jekyll/Gemfile
RUN bundle install
CMD bundle exec jekyll serve
