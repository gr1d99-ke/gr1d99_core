$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "gr1d99_core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "gr1d99_core"
  spec.version     = Gr1d99Core::VERSION
  spec.authors     = ["Gideon Kimutai"]
  spec.email       = ["gideonkimutai9@gmail.com"]
  spec.homepage    = ""
  spec.summary     = "Summary of Gr1d99Core."
  spec.description = "Description of Gr1d99Core."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = ""
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.3"
  spec.add_dependency "jwt"

  spec.add_development_dependency "sqlite3"
end
