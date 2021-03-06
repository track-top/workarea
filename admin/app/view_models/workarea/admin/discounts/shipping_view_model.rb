module Workarea
  module Admin
    module Discounts
      class ShippingViewModel < DiscountViewModel
        def shipping_service_options
          @shipping_service_options ||= Shipping::Service.all.map { |m| [m.name] }
        end

        def condition_options
          [
            [
              t('workarea.admin.pricing_discounts.options.for_everyone'),
              nil
            ],
            [
              t('workarea.admin.pricing_discounts.options.when_order_total'),
              'order_total'
            ],
            [
              t('workarea.admin.pricing_discounts.options.when_user_is_tagged'),
              'user_tag'
            ],
            [
              t('workarea.admin.pricing_discounts.options.when_in_segment'),
              'segments'
            ]
          ]
        end

        def selected_condition_option
          if use_order_total?
            'order_total'
          elsif user_tag?
            'user_tag'
          elsif active_segment_ids.present?
            'segments'
          end
        end
      end
    end
  end
end
