# frozen_string_literal: true

class CheckoutProcess
  module Steps
    class Payment < Base
      def name
        'payment'
      end

      def form
        CheckoutProcess::Forms::Payment
      end

      def view_template
        name
      end
    end
  end
end
