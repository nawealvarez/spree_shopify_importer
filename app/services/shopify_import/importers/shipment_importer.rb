module ShopifyImport
  module Importers
    class ShipmentImporter
      def initialize(fulfillment, parent_feed, spree_order)
        @fulfillment = fulfillment
        @parent_feed = parent_feed
        @spree_order = spree_order
      end

      def import!
        shopify_data_feed = create_data_feed
        ShopifyImport::Creators::ShipmentCreator.new(shopify_data_feed, @parent_feed, @spree_order).save!
      end

      private

      def create_data_feed
        Shopify::DataFeeds::Create.new(@fulfillment, @parent_feed).save!
      end
    end
  end
end