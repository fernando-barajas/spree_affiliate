module Spree
  class AffiliateReward < ActiveRecord::Base
    belongs_to :user, :class_name => 'Spree::User', :foreign_key => :user_id
    belongs_to :order, :class_name => 'Spree::Order', :foreign_key => :order_id
  
    attr_accessible :user, :order, :amount, :date_paid_out, :date_deleted, :comment
  
    def paid?
      date_paid_out.nil?
    end
  end
end