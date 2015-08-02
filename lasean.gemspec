# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lasean/version'

Gem::Specification.new do |spec|
  spec.name          = 'lasean'
  spec.version       = Lasean::VERSION
  spec.authors       = ['Vincent Esche']
  spec.email         = ['regexident@gmail.com']

  spec.summary       = %q{Latent Semantic Analysis (LSA) for Ruby.}
  spec.description   = %q{Implementation of Latent Semantic Analysis (LSA) for Ruby.}
  spec.homepage      = 'https://github.com/regexident/lasean'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = 'TODO: Set to "http://mygemserver.com" to prevent pushes to rubygems.org, or delete to allow pushes to any server.'
  end

  spec.add_dependency 'sivade', '~> 0.1.0'

  spec.add_development_dependency 'pry', '~> 0.10.1'
  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
end
