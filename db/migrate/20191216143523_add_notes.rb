class AddNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.string :type
      t.references :website, index: true
      t.timestamps
    end
  end
end
