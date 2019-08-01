FROM ruby:2.5.0
RUN gem install sinatra
RUN gem install thin
RUN mkdir /app
WORKDIR /app
ADD ./backend ./

EXPOSE 4567

CMD ruby sinatra.rb
