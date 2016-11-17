# Per-page layout changes:
#
# With no layout
# page '/path/to/file.html', :layout => false
#
# With alternative layout
# page '/path/to/file.html', :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page '/admin/*'
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy '/this-page-has-no-template.html', '/template-file.html', :locals => {
#  :which_fake_page => 'Rendering a fake page with a local variable' }

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     'Helping'
#   end
# end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :directory_indexes
activate :relative_assets
set :partials_dir, '_partials'

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
end

activate :prismic do |f|
  f.api_url = 'https://dunn.prismic.io/api'
  f.release = 'master'
  f.link_resolver = ->(link) {binding.pry; "#{link.type.pluralize}/#{link.slug}"}
end

races = YAML::load(File.read('data/prismic_races'))
races.each do |index, race|
  proxy(
    "/results/#{race.slugs[0]}.html",
    '/results.html',
    :locals => {:race => race},
    :ignore => true
  )
end

fit_tips = YAML::load(File.read('data/prismic_fittips'))
fit_tips.each do |index, fit_tip|
  proxy(
    "/fit-tips/#{fit_tip.slugs[0]}.html",
    '/fit-tip.html',
    :locals => {:fit_tip => fit_tip},
    :ignore => true
  )
end
