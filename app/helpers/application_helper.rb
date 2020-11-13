module ApplicationHelper
  require 'uri'

  def text_url_to_link(text)
    URI.extract(text, %w[http https]).uniq.each do |url|
      text.gsub!(url)
    end
    text
  end

  def delete_history_get
    delete_histories = Deletehistory.includes(:user).order(id: "DESC")
    return delete_histories
  end
end