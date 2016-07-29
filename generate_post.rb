require 'date'

def generate_post(title)
  date = Date.today.strftime('%Y-%m-%d')
  title = sanitize(title) || "post-#{increment_post_count}"

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

generate_post(ARGV[0])
