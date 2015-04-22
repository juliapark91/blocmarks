class Bookmark < ActiveRecord::Base
  belongs_to :topic
  before_save :normalize_url
  before_save :set_image_source


private 
  
  def normalize_url
    self.url = 'http://' + url unless (url.empty? || url.match(/^https?:\/\//))
  end  

  def set_image_source
    object = LinkThumbnailer.generate( self.url )
    self.image_source = object.images.first.src.to_s || "http://placehold.it/150x150"
  end


end
