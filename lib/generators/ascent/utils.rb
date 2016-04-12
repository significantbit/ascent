module Ascent
  module Generators
    module Utils
      module InstanceMethods
        def display(output, color = :green)
          say("           - #{output}", color)
        end
        def ask_for(wording, default_value = nil, override_if_present = nil)
          if override_if_present.present?
            display("Using [#{override_if_present}] for question '#{wording}'") && override_if_present
          else
            ask("           ?  #{wording} Press <enter> for [#{default_value}] >", :yellow).presence || default_value
          end
        end
      end
    end
  end
end
