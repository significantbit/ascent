module Ascent
  module Generators
    module Utils
      # Help functions for Ascent generators
      module InstanceMethods
        def display(output, color = :green)
          say("           - #{output}", color)
        end

        def ask_for(text, default_value = nil, override = nil)
          if override.present?
            display_text = "Using [#{override}] for question '#{text}'"
            display(display_text) && override
          else
            display_text = "    ?  #{text} Press <enter> for [#{default_value}]"
            ask(display_text, :yellow).presence ||
              default_value
          end
        end
      end
    end
  end
end
