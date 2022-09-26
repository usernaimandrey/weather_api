setup: env-prepare
	bin/setup
	bin/rails db:seed

start:
	bin/rails s -p 3000 -b "0.0.0.0"

console:
	bin/rails console

lint:
	bundle exec rubocop
	
lint-fix:
	bundle exec rubocop -A

test:
	NODE_ENV=test bundle exec rspec

#аргумент commit=[commit_name,skip] skip - не обязателный
push:
	bin/rails git:push$(commit)

env-prepare:
	bin/rails env:prepare

start-jobs:
	bin/rails jobs:work

clear-jobs:
	bin/rails jobs:clear

.PHONY: test
