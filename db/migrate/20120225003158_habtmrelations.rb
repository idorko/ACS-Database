class Habtmrelations < ActiveRecord::Migration
  def change
		create_table :clients_courses, :id => false do |t|
		t.references :client, :course
		end
		create_table :courses_guides, :id => false do |t|		
		t.references :course, :guide
		end
  end
end
