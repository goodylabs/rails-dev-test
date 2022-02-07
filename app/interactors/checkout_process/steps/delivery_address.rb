# frozen_string_literal: true

class CheckoutProcess
  module Steps
    class DeliveryAddress < Base
      def name
        'delivery_address'
      end

      def with_form?
        true
      end

      def form
        CheckoutProcess::Forms::DeliveryAddress
      end

      def view_template
        name
      end

      def update_checkout(form)
        checkout_process.checkout.update(delivery_address: form.values)
      end

      def checkout_details
        checkout_process.checkout.delivery_address
      end
    end
  end
end
