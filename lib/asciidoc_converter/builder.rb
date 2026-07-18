# frozen_string_literal: true

module AsciidocConverter
  class Builder < Bridgetown::Builder
    def build
      liquid_tag "asciidoc_converter" do
        "This plugin works!"
      end
    end
  end
end
