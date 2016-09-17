module UsersHelper
  def gravatar_url(email)
    hash = Digest::MD5.hexdigest(email.to_s.downcase)
    "https://www.gravatar.com/avatar/#{hash}"
  end
end
