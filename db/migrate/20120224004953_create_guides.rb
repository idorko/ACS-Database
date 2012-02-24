class CreateGuides < ActiveRecord::Migration
  def self.up
    create_table :guides do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :phonenum
      t.string :certifications
      t.string :string

      t.timestamps
    end
  end
	
	def self.down	
		drop_table :guides
	end
end
