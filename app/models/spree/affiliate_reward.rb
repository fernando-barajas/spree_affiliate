module Spree
  class AffiliateReward < ActiveRecord::Base
    belongs_to :user, :class_name => 'Spree::User', :foreign_key => :user_id
    belongs_to :original_order, :class_name => 'Spree::Order', :foreign_key => :order_id
  
    attr_accessible :user, :amount, :date_paid_out, :date_deleted, :comment, :paid
    
    scope :ordered, order("order_id DESC")
    
    default_scope ordered
      
    def paid?
      !date_paid_out.nil?
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