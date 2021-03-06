class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy
  before_save :normalize_url
  before_save :set_image_source
  has_many :likes, dependent: :destroy
  default_scope { order('created_at DESC') }

private 

  def normalize_url
    self.url = 'http://' + url unless (url.empty? || url.match(/^https?:\/\//))
    self.url = 'http://www.' + url unless (url.empty? || url.match(/www/))
  end  

  def set_image_source
    self.image_source = Faker::Avatar.image("my-own-slug", "150x150")
  end
end
