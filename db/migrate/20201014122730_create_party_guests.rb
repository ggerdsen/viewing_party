class CreatePartyGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :party_guests do |t|
      t.references :party, foreign_key: true
      t.references :guest

      t.timestamps
    end
  end
end
