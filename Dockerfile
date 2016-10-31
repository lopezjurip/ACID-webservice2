FROM ruby:2.3.1-onbuild

ENV LANG C.UTF-8

WORKDIR /usr/src/app

EXPOSE 3000
CMD ["ruby", "main.rb"]
