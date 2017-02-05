class Players < ActiveRecord::Migration[5.0]

  def up
    create_table :players do |t|
      t.string :name
      t.string :position
      t.boolean :healthy
      t.belongs_to :team, :foreign_key => 'teams.id'
    end
  end

  def down
    drop_table :players
  end

end
