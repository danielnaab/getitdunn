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

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-22376734-4'
  ga.minify = true
end

activate :prismic do |f|
  f.api_url = 'https://dunn.prismic.io/api'
  f.release = 'master'
  f.link_resolver = ->(link) { "binding.pry; #{link.type.pluralize}/#{link.slug}" }
end

activate :disqus do |d|
  d.shortname = 'get-it-dunn-run'
end

# All pages except home and the race page use the same layout (the header differs)
page '/index.html', :layout => :home
page '/race.html', :layout => :home

if File.exists? ('data/prismic_races')
  races = YAML::load(File.read('data/prismic_races'))
  races.each do |index, race|
    proxy(
      "/#{race.uid}.html",
      '/race.html',
      :locals => {:race => race},
      :ignore => true
    )
  end
end

if File.exists? ('data/prismic_fittips')
  fit_tips = YAML::load(File.read('data/prismic_fittips'))
  fit_tips.each do |index, fit_tip|
    proxy(
      "/blog/#{fit_tip.slugs[0]}.html",
      '/blog-entry.html',
      :locals => {:fit_tip => fit_tip},
      :ignore => true
    )
  end
end

activate :deploy do |deploy|
  deploy.method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch   = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end
