class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  before_save :normalize_url
  before_save :set_image_source

private 

  def normalize_url
    self.url = 'http://' + url unless (url.empty? || url.match(/^https?:\/\//))
    self.url = 'http://www.' + url unless (url.empty? || url.match(/www/))
  end  

  def set_image_source
    #object = LinkThumbnailer.generate( self.url )
    #self.image_source = object.images.first.src.to_s || "http://placehold.it/150x150"
    self.image_source = Faker::Avatar.image("my-own-slug", "150x150")
  end
end
