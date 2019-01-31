module ShakespeareAnalyser
    module UseCases
        module Utils
            class ScriptAnalyser
                def self.call(data:)
                    results = {}
                    data.each do |speech|
                        character_name = speech.at_css('SPEAKER').content
                        next if character_name == 'ALL'
                        lines = speech.css('LINE').count
                        if results[character_name]
                            results[character_name] += lines
                        else
                            results[character_name] = lines
                        end
                    end
                    results
                end
            end
        end
    end
end