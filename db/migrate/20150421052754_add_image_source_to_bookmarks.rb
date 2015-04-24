class AddImageSourceToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :image_source, :string
  end
end
