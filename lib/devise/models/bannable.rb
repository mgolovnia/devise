require 'devise/hooks/bannable'
module Devise
  module Models
    module Bannable
      extend ActiveSupport::Concern

      def banned?
        !!self.banned_at
      end

      def ban!
        self.banned_at = Time.now
        self.save
      end

      def unban!
        self.banned_at = nil
        self.save
      end
      
      def banned_message
        :banned
      end

        
      module ClassMethods
        
        def bannable?
          true
        end

      end
    
    end
  end
end
