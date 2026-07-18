# frozen_string_literal: true

require_relative "lib/asciidoc_converter/version"

Gem::Specification.new do |spec|
  spec.name          = "asciidoc_converter"
  spec.version       = AsciidocConverter::VERSION
  spec.author        = "Sarah Rogue"
  spec.email         = "emo-girl@sarah-rogue.me"
  spec.summary       = "AsciiDoc Front Matter reader and Converter"
  spec.homepage      = "https://github.com/SarahRogue81/asciidoc_converter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|script|spec|features|frontend)/!) }
  spec.test_files    = spec.files.grep(%r!^test/!)
  spec.require_paths = ["lib"]
  # Uncomment this if you wish to supply a companion NPM package and/or command features:
  # spec.metadata = {
  #   "npm_add" => "asciidoc_converter@#{AsciidocConverter::VERSION}",
  #   "bridgetown_features" => "true"
  # }

  spec.required_ruby_version = ">= 3.3"

  spec.add_dependency "asciidoctor", ">= 2.0"
  spec.add_dependency "bridgetown", ">= 2.2"
end
