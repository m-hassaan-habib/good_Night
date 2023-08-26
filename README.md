# GoodNight

## Setup Dependecies

* ruby 3.0.2
* rails 7.0
* postgresql

## Installation Guide

>#### Install RVM
Install the right ruby version (currently 3.0.2):
```shell
  rvm install "ruby-3.0.2"
```

>#### Check your Ruby version

```shell
  ruby -v
```

The ouput should start with something like `ruby 3.0.2`

>#### Install Database(postgresql)

```shell
  brew install postgresql
  brew services start postgresql
```

## Run Setup

* bundle install
* rails db:create
* rails db:migrate

### Terminal Structure

* Tab 1: Github
* Tab 2: Rails Console (rails c)
* Tab 3: Rails Server (rails s)
# good_Night
