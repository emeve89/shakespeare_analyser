module ShakespeareAnalyser
    module UI
        class CLIPresenter
            def self.call(data:)
                data.each do |character_name, num_of_lines|
                    puts "#{num_of_lines} #{character_name}"
                end
            end
        end
    end
end