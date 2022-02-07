# frozen_string_literal: true

class CheckoutProcess
  module Steps
    class PaymentInfo < Base
      def name
        'payment_info'
      end

      def with_form?
        true
      end

      def form
        CheckoutProcess::Forms::PaymentInfo
      end

      def view_template
        name
      end

      def update_checkout(form)
        checkout_process.checkout.update(payment_details: form.values)
      end

      def checkout_details
        checkout_process.checkout.payment_details
      end
    end
  end
end
