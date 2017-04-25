gem list | cut -d ' ' -f 1 | while read gem; do 
  gem uninstall --all -a --ignore-dependencies --force --no--check-development "$gem"; 
done; 

gem list | cut -d ' ' -f 1 | while read gem; do 
  gem uninstall --user-install  --all -a --ignore-dependencies --force --no--check-development "$gem"; 
done; 

gem install github-pages -v 117
gem install activesupport -v 4.2.7
gem install addressable -v 2.4.0
gem install backports -v 3.6.8
gem install bundler -v 1.14.3
gem install coffee-script -v 2.4.1
gem install coffee-script-source -v 1.12.2
gem install colorator -v 1.1.0
gem install ethon -v 0.10.1
gem install execjs -v 2.7.0
gem install faraday -v 0.11.0
gem install faraday_middleware -v 0.11.0.1
gem install ffi -v 1.9.17
gem install font-awesome-sass -v 4.7.0
gem install forwardable-extended -v 2.6.0
gem install gemoji -v 2.1.0
gem install gh -v 0.15.0
gem install github-pages-health-check -v 1.3.0
gem install highline -v 1.7.8
gem install html-pipeline -v 2.5.0
gem install i18n -v 0.8.0
gem install jekyll -v 3.3.1
gem install jekyll-avatar -v 0.4.2
gem install jekyll-coffeescript -v 1.0.1
gem install jekyll-compose -v 0.5.0
gem install jekyll-default-layout -v 0.1.4
gem install jekyll-feed -v 0.8.0
gem install jekyll-gist -v 1.4.0
gem install jekyll-github-metadata -v 2.3.1
gem install jekyll-mentions -v 1.2.0
gem install jekyll-optional-front-matter -v 0.1.2
gem install jekyll-paginate -v 1.1.0
gem install jekyll-readme-index -v 0.0.3
gem install jekyll-redirect-from -v 0.11.0
gem install jekyll-relative-links -v 0.2.1
gem install jekyll-sass-converter -v 1.5.0
gem install jekyll-seo-tag -v 2.1.0
gem install jekyll-sitemap -v 0.12.0
gem install jekyll-swiss -v 0.4.0
gem install jekyll-theme-architect -v 0.0.3
gem install jekyll-theme-cayman -v 0.0.3
gem install jekyll-theme-dinky -v 0.0.3
gem install jekyll-theme-hacker -v 0.0.3
gem install jekyll-theme-leap-day -v 0.0.3
gem install jekyll-theme-merlot -v 0.0.3
gem install jekyll-theme-midnight -v 0.0.3
gem install jekyll-theme-minimal -v 0.0.3
gem install jekyll-theme-modernist -v 0.0.3
gem install jekyll-theme-primer -v 0.1.7
gem install jekyll-theme-slate -v 0.0.3
gem install jekyll-theme-tactile -v 0.0.3
gem install jekyll-theme-time-machine -v 0.0.3
gem install jekyll-titles-from-headings -v 0.1.4
gem install jekyll-watch -v 1.5.0
gem install jemoji -v 0.7.0
gem install json -v 1.8.6
gem install kramdown -v 1.11.1
gem install launchy -v 2.4.3
gem install liquid -v 3.0.6
gem install listen -v 3.0.6
gem install mercenary -v 0.3.6
gem install mini_portile2 -v 2.1.0
gem install minima -v 2.0.0
gem install minitest -v 5.10.1
gem install multi_json -v 1.12.1
gem install multipart-post -v 2.0.0
gem install net-dns -v 0.8.0
gem install net-http-persistent -v 2.9.4
gem install net-http-pipeline -v 1.0.1
gem install nokogiri -v 1.6.8.1
gem install octokit -v 4.6.2
gem install pathutil -v 0.14.0
gem install public_suffix -v 2.0.5
gem install pusher-client -v 0.6.2
gem install rb-fsevent -v 0.9.8
gem install rb-inotify -v 0.9.8
gem install rouge -v 1.11.1
gem install safe_yaml -v 1.0.4
gem install sass -v 3.4.23
gem install sawyer -v 0.8.1
gem install terminal-table -v 1.7.3
gem install thread_safe -v 0.3.5
gem install travis -v 1.8.6
gem install typhoeus -v 0.8.0
gem install tzinfo -v 1.2.2
gem install unicode-display_width -v 1.1.3
gem install websocket -v 1.2.4

gem install github-markdown
gem install github-markup
gem install github_api
gem install github_cli
gem install gitlab-grit
gem install gollum
gem install html2markdown
gem install markdown
gem install markdownizer
gem install mdl
gem install multimarkdown
gem install octokit
gem install pygments.rb
gem install reverse_markdown
gem install rmagick
gem install scss_lint
gem install svg_optimizer
gem install svg_palette
gem install svg_profiler
gem install sys-proctable
gem install tty
gem install unicode
gem install unicode_utils
gem install unmarkdown
gem install word-to-markdown

