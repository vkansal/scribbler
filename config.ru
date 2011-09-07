# This file is used by Rack-based servers to start the application.
use Rack::Static,
  :urls => ["/stylesheets", "/images"],
  :root => "public"

require ::File.expand_path('../config/environment',  __FILE__)
run Scribbler::Application
