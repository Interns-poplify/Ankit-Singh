class RemoveRoleFromAuthors < ActiveRecord::Migration
  def change
    remove_column :authors, :role, :string, :default => 'author'
  end
end
