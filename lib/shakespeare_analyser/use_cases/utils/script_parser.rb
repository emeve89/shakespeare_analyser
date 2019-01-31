module ShakespeareAnalyser
    module UseCases
        module Utils
            class ScriptParser
                def self.call(data:)
                    parsed_data = Nokogiri::XML(data)
                    parsed_data.css('SPEECH')
                end
            end
        end
    end
end