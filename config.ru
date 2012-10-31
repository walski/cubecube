Bundler.require

root = File.dirname(__FILE__)
brochure = Brochure.app(root, template_options: {".scss" => Compass.sass_engine_options})

app = lambda do |env|
  env['PATH_INFO'] = '/index.html' if env['PATH_INFO'] == '/'
  brochure.call(env)
end

run app
