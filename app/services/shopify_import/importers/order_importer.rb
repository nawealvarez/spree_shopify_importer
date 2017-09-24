module ShopifyImport
  module Importers
    class OrderImporter < BaseImporter
      private

      def creator
        ShopifyImport::DataSavers::Orders::OrderCreator
      end

      def shopify_class
        ShopifyAPI::Product
      end
    end
  end
end
