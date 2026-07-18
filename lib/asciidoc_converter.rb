# frozen_string_literal: true

require "bridgetown"
require "asciidoc_converter/asciidoc"
require "asciidoc_front_matter_loader"

# @param config [Bridgetown::Configuration::ConfigurationDSL]
Bridgetown.initializer :asciidoc_converter do |config|
  # Add code here which will run when a site includes
  # `init :asciidoc_converter`
  # in its configuration

  # Add default configuration data:
  # config.asciidoc_converter ||= {}
  # config.asciidoc_converter.my_setting ||= 123

  # Register your builder:
  # config.builder AsciiDocConverter::Builder
  config.converter AsciiDocConverter::AsciiDoc

  # You can optionally supply a source manifest:
  # config.source_manifest(
  #   origin: AsciiDocConverter,
  #   components: File.expand_path("../components", __dir__),
  #   layouts: File.expand_path("../layouts", __dir__),
  #   content: File.expand_path("../content", __dir__)
  # )

  AsciiDocFrontMatterLoader.register!
end
