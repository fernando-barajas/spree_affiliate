module Spree
  class AffiliateReward < ActiveRecord::Base
    belongs_to :user, :class_name => 'Spree::User', :foreign_key => :user_id
    belongs_to :original_order, :class_name => 'Spree::Order', :foreign_key => :order_id
  
    attr_accessible :user, :order, :amount, :date_paid_out, :date_deleted, :comment, :paid
  
    # scope :ordered, order("order.created_at DESC")
      
    def paid?
      date_paid_out.present?
    end
    
    def paid=(object)
      # debugger
      if(object.to_i == 1 and self.date_paid_out.nil?)
        self.date_paid_out = Time.now
      elsif object.to_i == 0 and self.date_paid_out.present?
        self.date_paid_out = nil
      end
    end
  end
end