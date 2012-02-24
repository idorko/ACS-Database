class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.integer :num_clients
      t.integer :num_guides
      t.string :experience
      t.string :type
      t.date :date
      t.time :time
      t.string :contact

      t.timestamps
    end
  end

	def self.down
		drop_table :courses
	end
end
