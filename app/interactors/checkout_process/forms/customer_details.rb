# frozen_string_literal: true

class CheckoutProcess
  module Forms
    class CustomerDetails
      include ActiveModel::Model

      attr_accessor :email

      validates :email, presence: true,
                        format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

      def initialize(attributes = {})
        @attributes = attributes
        @email = attributes['email']
      end

      def values
        attributes
      end

      private

      attr_reader :attributes
    end
  end
end
