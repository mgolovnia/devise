require 'devise/hooks/bannable'
module Devise
  module Models
    module Bannable
      extend ActiveSupport::Concern

      def banned?
        self.banned
      end

      def ban!
        self.banned = true
        self.save
      end

      def unban!
        self.banned = false
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
