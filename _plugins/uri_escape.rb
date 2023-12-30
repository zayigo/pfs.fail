require "erb"

module Jekyll
  module URIEscape
    def uri_escape(text)
      ERB::Util.url_encode(text) if !text.nil?
    end
  end
end
Liquid::Template.register_filter(Jekyll::URIEscape)