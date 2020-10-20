module ApplicationHelper
  require 'uri'

  def text_url_to_link(text)
    URI.extract(text, %w[http https]).uniq.each do |url|
      text.gsub!(url)
    end
    text
  end
end
