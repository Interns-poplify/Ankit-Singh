class AddAuthorIdToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :author_id, :string
  end
end
