# frozen_string_literal: true

class CheckoutProcess
  module Forms
    class DeliveryAddress
      include ActiveModel::Model

      attr_accessor :street, :postal_code, :city

      validates_presence_of :street, :postal_code, :city

      def initialize(attributes = {})
        @attributes = attributes

        @street = attributes['street']
        @postal_code = attributes['postal_code']
        @city = attributes['city']
      end

      def values
        attributes
      end

      private

      attr_reader :attributes
    end
  end
end
