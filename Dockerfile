from jekyll/minimal:pages

# https://github.com/jekyll/jekyll/issues/8523
# `bundle install webrick` updates some other gems
# `gem install webrick` simply install webrick
run gem cleanup && gem install webrick
