class RenameTagsColumnByLink < ActiveRecord::Migration
  def up
    rename_column :links, :tags, :tag_names
  end

  def down
    rename_column :links, :tag_names, :tags
  end
end
