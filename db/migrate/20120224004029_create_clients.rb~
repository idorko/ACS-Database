class CreateClients < ActiveRecord::Migration
  def self.up 
			create_table :clients do |t|
      	t.string :name
      	t.integer :age
      	t.string :email
      	t.string :phone
      	t.string :town
      	t.string :state
      	t.string :referal
      	t.string :experience

      	t.timestamps
    end
  end

	def self.down
		drop_table :clients
	end

end
