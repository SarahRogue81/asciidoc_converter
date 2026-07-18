require "asciidoctor"

class AsciiDocFrontMatterLoader < Bridgetown::FrontMatter::Loaders::Base
  def self.register!
    Bridgetown::FrontMatter::Loaders.register(self)
  end

  # Tell Bridgetown to intercept .adoc and .asciidoc files before standard parsing
  def self.header?(file)
    File.extname(file) =~ /^\.(adoc|asciidoc)$/i
  end

  def read(file_contents, file_path: "")
    return nil unless self.class.header?(file_path)

    # Use Asciidoctor to parse only the header for performance
    doc = Asciidoctor.load(file_contents, parse_header_only: true)
    
    # Map native AsciiDoc attributes into Bridgetown's data structure
    front_matter = {
      "title"                      => doc.doctitle,
      "description"                => doc.attributes["description"],
      "image"                      => doc.attributes["image"],
      "author"                     => doc.attributes["author"],
      "lang"                       => doc.attributes["lang"],
      "categories"                 => doc.attributes["categories"],
      "category"                   => doc.attributes["category"],
      "date"                       => doc.attributes["date"],
      "id"                         => doc.attributes["id"],
      "layout"                     => doc.attributes["layout"] || "post",
      "paginate"                   => doc.attributes["paginate"],
      "permalink"                  => doc.attributes["permalink"],
      "published"                  => doc.attributes["published"],
      "sitemap_change_frequency"   => doc.attributes["sitemap_change_frequency"],
      "sitemap_priority"           => doc.attributes["sitemap_priority"],
      "slug"                       => doc.attributes["slug"],
      "tag"                        => doc.attributes["tag"],
      "tags"                       => doc.attributes["tags"],
      "template_engine"            => doc.attributes["template_engine"],
      "willamette"                 => doc.attributes["willamette"],
      "willamette.article_classes" => doc.attributes["willamette.article_classes"]
    }.compact

    Bridgetown::FrontMatter::Loaders::Result.new(
      content: file_contents,
      front_matter: front_matter,
      line_count: file_contents.lines.size
    )
  end
end
