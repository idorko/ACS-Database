class Associations < ActiveRecord::Migration
	def change
		add_column :courses, "client_id", :integer
		add_column :courses, "guide_id", :integer
	end
end
