class RemoveCreatedAtAndUpdatedAtToTag < ActiveRecord::Migration
  def up
    remove_column :tags, :created_at
    remove_column :tags, :updated_at
  end

  def down
    add_column :tags, :updated_at, :string
    add_column :tags, :created_at, :string
  end
end
