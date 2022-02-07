# frozen_string_literal: true

class CheckoutProcess
  module Steps
    class Summary < Base
      def name
        'summary'
      end

      def with_form?
        false
      end

      def view_template
        name
      end

      def update_order(_form)
        true
      end
    end
  end
end
