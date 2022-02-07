# frozen_string_literal: true

class CheckoutProcess
  module Steps
    class CustomerDetails < Base
      def name
        'customer_details'
      end

      def with_form?
        true
      end

      def form
        CheckoutProcess::Forms::CustomerDetails
      end

      def view_template
        name
      end

      def update_checkout(form)
        checkout_process.checkout.update(customer_details: form.values)
      end

      def checkout_details
        checkout_process.checkout.customer_details
      end
    end
  end
end
