class CreateSpreeAffiliateReward < ActiveRecord::Migration
  def up
    create_table :spree_affiliate_rewards do |t|
      t.integer :user_id
      t.integer :order_id
      t.float :amount
      t.date :date_paid_out
      t.date :date_deleted
      t.string :comment
    end
  end

  def down
    drop_table :spree_affiliate_rewards
  end
end
