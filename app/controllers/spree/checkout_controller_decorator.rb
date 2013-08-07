Spree::CheckoutController.class_eval do
  include AffiliateCredits

  private

  def after_complete
    # debugger
    session[:order_id] = nil

    # still should create reward if the user was a guest
    sender = (spree_current_user && spree_current_user.affiliate_partner) || (cookies[:ref_id] && Spree::User.find_by_id(cookies[:ref_id]))
    
    # if spree_current_user && spree_current_user.affiliate_partner
      # && spree_current_user.orders.where(:state => 'complete').count == 1
      # sender = spree_current_user.affiliate_partner.partner

      #create credit (if required)
      create_affiliate_credits(sender, spree_current_user, "purchase", @order) unless sender.nil?
    # end
  end
end
