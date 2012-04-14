class AddIsPublicToLink < ActiveRecord::Migration
  def change
    add_column :links, :is_public, :boolean

  end
end
