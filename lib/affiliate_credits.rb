module AffiliateCredits
  private

  def create_affiliate_credits(sender, recipient, event, order)
    # debugger
    #check if sender should receive credit on affiliate register
    sender_credit_amount = [SpreeAffiliate::Config["sender_credit_on_#{event}_amount".to_sym].to_f, (SpreeAffiliate::Config["sender_credit_on_#{event}_amount_percent".to_sym].to_f / 100.0) * order.total].max
    
    Spree::AffiliateReward.create(:user => sender, :order => order,  :amount => sender_credit_amount)
    
    # if sender_credit_amount.to_f > 0
    #       credit = Spree::StoreCredit.create(:amount => sender_credit_amount,
    #                          :remaining_amount => sender_credit_amount,
    #                          :reason => "Affiliate: #{event}", :user_id => sender.id)
    # 
    #       log_event recipient.affiliate_partner || sender, sender, credit, event, order
    #     end
    # 
    #     unless recipient.nil?
    #       #check if affiliate should recevied credit on sign up
    #       recipient_credit_amount = [SpreeAffiliate::Config["recipient_credit_on_#{event}_amount".to_sym].to_f,
    #                                 (SpreeAffiliate::Config["recipient_credit_on_#{event}_amount_percent".to_sym].to_f / 100.0) * order.total
    #                                 ]
    #       if recipient_credit_amount.to_f > 0
    #         credit = Spree::StoreCredit.create(:amount => recipient_credit_amount,
    #                            :remaining_amount => recipient_credit_amount,
    #                            :reason => "Affiliate: #{event}", :user => recipient)
    # 
    #         log_event recipient.affiliate_partner, recipient, credit, event, order
    #       end
    #     end

  end

  # def log_event(affiliate, user, credit, event, order)
  #   affiliate.events.create(:reward => credit, :name => event, :user => user, :order => order)
  # end

end
