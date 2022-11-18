class AddCachedImageUrlToUnits < ActiveRecord::Migration[7.0]
  def change
    add_column :units, :cached_image_url, :string
  end
end
