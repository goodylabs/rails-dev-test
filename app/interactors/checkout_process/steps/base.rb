# frozen_string_literal: true

class CheckoutProcess
  module Steps
    class Base
      def initialize(checkout_process = nil)
        @checkout_process = checkout_process
      end

      def name
        raise NotImplementedError
      end

      def with_form?
        false
      end

      def form
        raise NotImplementedError
      end

      def view_template
        name
      end

      def update_checkout(_form)
        true
      end

      def data_storage
        raise NotImplementedError
      end

      private

      attr_reader :checkout_process
    end
  end
end
