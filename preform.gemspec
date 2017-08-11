require_relative "./lib/preform"

Gem::Specification.new do |s|
  s.name     = "preform"
  s.summary  = "Preform"
  s.version  = Preform::VERSION
  s.authors  = ["Steve Weiss"]
  s.email    = ["weissst@mail.gvsu.edu"]
  s.homepage = "https://github.com/sirscriptalot/preform"
  s.license  = "MIT"
  s.files    = `git ls-files`.split("\n")

  s.add_development_dependency "cutest"
end
