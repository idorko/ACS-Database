class CliffsCourses < ActiveRecord::Migration
  def change
		add_column :courses, "cliff_id", :integer
		add_index :courses, [:cliff_id, :date, :id]
	end
end
