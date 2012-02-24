class CreateCliffs < ActiveRecord::Migration
  def self.up
    create_table :cliffs do |t|
      t.string :name

      t.timestamps
    end
  end

	def self.down
		drop_tabel :cliffs
	end
end
