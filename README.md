# Go Fish Go

This is a simple API service for Fish Go card game.

### Get Started

- Assuming you have running Postgresql in your system
- Assuming you have RVM with ruby 2.6 or just ruby 2.6 installed in your system/

After cloning this repo, run the follow code to get you started.


```shell
cd go_fish_go

gem install bundler

bundle install

rake db:migrate

bundle exec rspec
```

If everything is green.

```shell
rails s
```

See the API documentation in: localhost:3000/apipie

