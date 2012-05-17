module ApplicationHelper
  def image_gravatar(email, size)
    hash = Digest::MD5.hexdigest email
    image_url = "http://1.gravatar.com/avatar/#{hash}?size=#{size}"
    image_tag image_url
  end
end
