class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, index: true
      t.references :followed, null: false, index: true
      t.index %i[follower_id followed_id], unique: true

      t.timestamps
    end
  end
end
