class Expression < ApplicationRecord
    after_create_commit  :send_expressiom
    
    def send_expressiom
        ExpressionBroadcastJob.perform_later(self)
    end
   
end
