# frozen_string_literal: true

class CheckoutProcess
  module Forms
    class PaymentInfo
      include ActiveModel::Model

      attr_accessor :payment_method

      validates_presence_of :payment_method

      def initialize(attributes = {})
        @attributes = attributes

        @payment_method = attributes['payment_method']
      end

      def values
        attributes
      end

      private

      attr_reader :attributes
    end
  end
end
