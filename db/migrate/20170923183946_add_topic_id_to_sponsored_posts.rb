class AddTopicIdToSponsoredPosts < ActiveRecord::Migration
  def change
    add_column :sponsored_posts, :topic_id, :integer
  end
end
