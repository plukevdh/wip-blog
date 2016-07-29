run:
	bundle exec jekyll serve -Do

build:
	bundle exec jekyll build

publish: build
	bundle exec s3_website push

release: publish

post:
	ruby generate_post.rb ${title}
