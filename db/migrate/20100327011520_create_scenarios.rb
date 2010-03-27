class CreateScenarios < ActiveRecord::Migration
  def self.up
    create_table :scenarios do |t|
      t.string :title
      t.string :given_block
      t.string :when_block
      t.string :then_block
      t.integer :feature_id
      t.timestamps
    end
  end

  def self.down
    drop_table :scenarios
  end
end
