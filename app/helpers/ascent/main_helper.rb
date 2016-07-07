require 'builder'

module Ascent
  module MainHelper
    def ascent_form_for(*args, &block)
      options = args.extract_options!.reverse_merge(builder: Ascent::FormBuilder)

      form_for(*(args << options), &block)
    end
  end
end
