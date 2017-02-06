class Teams < ActiveRecord::Migration[5.0]

  def up
    create_table :teams do |t|
      t.string :name
      t.string :division
    end
  end

  def down
    drop_table :teams
  end

end

after do
  ActiveRecord::Base.connection.close
end
