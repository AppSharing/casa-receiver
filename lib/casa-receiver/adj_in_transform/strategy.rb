module CASA
  module Receiver
    module AdjInTransform
      class Strategy

        def self.factory attributes
          CASA::Receiver::AdjInTransform::Strategy.new attributes
        end

        attr_reader :attributes

        def initialize attributes
          @attributes = attributes
        end

        def execute! payload_hash
          @attributes.each do |attribute_name, attribute|
            payload_hash['attributes'][attribute.section][attribute_name] = attribute.transform payload_hash
          end
        end

      end
    end
  end
end