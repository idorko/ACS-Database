class Lastnames < ActiveRecord::Migration
		def change
			add_column :clients, :first_name, :string
			add_column :clients, :last_name, :string
			remove_column :clients, :name	
			add_column :guides, :first_name, :string
			add_column :guides, :last_name, :string
			remove_column :guides, :name	
		end
end
