class CreateSponsoredPosts < ActiveRecord::Migration
  def change
    create_table :sponsored_posts do |t|
      t.stringbody :title
      t.integer :price

      t.timestamps null: false
    end
  end
end
