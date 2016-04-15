class CreateAscentMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :ascent_nodes do |t|
      t.string :name
      t.string :slug
      t.integer :parent_id
      t.integer :sort_order
      t.string :url
      t.string :controller_class
      t.boolean :published, default: false

      t.timestamps null: false
    end

    create_table :ascent_node_hierarchies do |t|
      t.integer     :ancestor_id, null: false
      t.integer     :descendant_id, null: false
      t.integer     :generations, null: false
    end

    create_table :ascent_node_blocks do |t|
      t.belongs_to  :node, foreign_key: true
      t.integer     :mountable_id
      t.string      :mountable_type
      t.integer     :sort_order
      t.timestamps
    end

    add_index :ascent_node_blocks, :mountable_id
    add_index :ascent_node_hierarchies, [:ancestor_id, :descendant_id, :generations], unique: true, name: "node_anc_desc_idx"
    add_index :ascent_node_hierarchies, [:descendant_id], name: "node_desc_idx"

    Ascent::Node.first_or_create(name: 'Root', parent_id: nil, published: true, sort_order: 0)
  end
end
