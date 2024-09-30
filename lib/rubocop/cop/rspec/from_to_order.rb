# frozen_string_literal: true

module RuboCop
  module Cop
    module RSpec
      class FromToOrder < Base
        # @!method be_nil_matcher?(node)
        def_node_matcher :correct_order?, <<~PATTERN
          (send (send (block (send nil? :change) ... ...) :from ...) :to ...)
        PATTERN

        MSG = 'Order from - to in change matcher.'
        RESTRICT_ON_SEND = %i[
          change
        ].freeze

        def on_send(node)
          add_offense(node) unless correct_order?(node.parent.parent.parent)
        end
      end
    end
  end
end