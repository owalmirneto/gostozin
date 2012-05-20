module ApplicationHelper
  def image_gravatar(email, size, options = {})
    hash = Digest::MD5.hexdigest email 
    image_url = "http://1.gravatar.com/avatar/#{hash}?size=#{size}"
    image_tag(image_url, options)
  end
end
