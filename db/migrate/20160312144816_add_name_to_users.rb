class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :job_title, :string
    add_column :users, :contact_info, :string
  end
end
