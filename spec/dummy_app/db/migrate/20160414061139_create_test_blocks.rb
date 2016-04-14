class CreateTestBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :test_blocks do |t|
      t.text :content
      t.string :title

      t.timestamps
    end
  end
end
