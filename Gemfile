source 'https://rubygems.org'

require 'json'
require 'open-uri'
versions = JSON.parse(open('https://pages.github.com/versions.json').read)

group :jekyll_plugins do
gem 'activesupport', versions['activesupport']
gem 'github-pages', versions['github-pages']
gem 'github-pages-health-check', versions['github-pages-health-check']
gem 'html-pipeline', versions['html-pipeline']
gem 'jekyll', versions['jekyll']
gem 'jekyll-avatar', versions['jekyll-avatar']
gem 'jekyll-coffeescript', versions['jekyll-coffeescript']
gem 'jekyll-default-layout', versions['jekyll-default-layout']
gem 'jekyll-feed', versions['jekyll-feed']
gem 'jekyll-gist', versions['jekyll-gist']
gem 'jekyll-github-metadata', versions['jekyll-github-metadata']
gem 'jekyll-mentions', versions['jekyll-mentions']
gem 'jekyll-optional-front-matter', versions['jekyll-optional-front-matter']
gem 'jekyll-paginate', versions['jekyll-paginate']
gem 'jekyll-readme-index', versions['jekyll-readme-index']
gem 'jekyll-redirect-from', versions['jekyll-redirect-from']
gem 'jekyll-relative-links', versions['jekyll-relative-links']
gem 'jekyll-sass-converter', versions['jekyll-sass-converter']
gem 'jekyll-seo-tag', versions['jekyll-seo-tag']
gem 'jekyll-sitemap', versions['jekyll-sitemap']
gem 'jekyll-swiss', versions['jekyll-swiss']
gem 'jekyll-titles-from-headings', versions['jekyll-titles-from-headings']
gem 'jemoji', versions['jemoji']
gem 'kramdown', versions['kramdown']
gem 'liquid', versions['liquid']
gem 'listen', versions['listen']
gem 'minima', versions['minima']
gem 'nokogiri', versions['nokogiri']
gem 'rouge', versions['rouge']
gem 'safe_yaml', versions['safe_yaml']
gem 'sass', versions['sass']
end

group :jekyll_misc_plugins do
gem 'jekyll-compose', '>= 0.4.1'
gem 'font-awesome-sass', '>= 4.6.2'
gem 'travis', '>= 1.8.2'
gem 'jekyll-contentblocks'
end
