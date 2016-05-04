require 'date'

desc "Serve local"
task :run do
  system "bundle exec jekyll serve"
end

desc "Publish site to S3"
task :publish do
  system 'bundle exec jekyll build'
  system 'bundle exec s3_website push'
end

task release: :publish

desc "Create new post for this week"
task :post, [:title] do |t, args|
  date = Date.today.strftime('%Y-%m-%d')
  title = sanitize(args[:title]) || "post-#{increment_post_count}"

  File.open("_posts/#{date}-#{title}.md", "w") do |io|
    io.write <<-MATTER
---
layout: post
tags: thoughts
---

MATTER
  end
end

def sanitize(title)
  title.gsub(' ', "-")
end

def post_count
  Dir.glob("_posts/*.{md,markdown}").count
end

def increment_post_count
  post_count + 1
end
