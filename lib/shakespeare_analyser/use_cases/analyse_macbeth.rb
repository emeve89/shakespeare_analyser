module ShakespeareAnalyser
    module UseCases
        class AnalyseMacbeth
            attr_reader :results

            def initialize(url:, output:)
                @url = url
                @output = output
                @results = Hash.new
            end

            def call
                get_script
                parse_script
                analyse_script
                present_results
            end

            private

            attr_accessor :script, :speeches, :result, :downloader, :output, :url

            def get_script
                @script = Utils::ScriptDownloader.call(url: url)
            end

            def parse_script
                @speeches = Utils::ScriptParser.call(data: script)
            end

            def analyse_script
                @results = Utils::ScriptAnalyser.call(data: speeches)
            end

            def present_results
                output.call(data: results)
            end
        end
    end
end