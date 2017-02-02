require_relative 'test_environment'

class CreateTables < ActiveRecord::Migration[5.0]

  def up
    create_table :teams do |t|
      t.string :name
      t.string :division
    end

    create_table :players do |t|
      t.string :name
      t.string :position
      t.boolean :healthy
      t.belongs_to :team, :foreign_key => 'teams.id'
    end
  end

  def down
    drop_table :teams
    drop_table :players
  end

end

def main
  action = (ARGV[0] || :up).to_sym

  CreateTables.migrate(action)
end

main if __FILE__ == $PROGRAM_NAME
