require_relative './lib/shakespeare_analyser'

url = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"
output = ShakespeareAnalyser::UI::CLIPresenter
analyser = ShakespeareAnalyser::UseCases::AnalyseMacbeth.new(url: url, output: output)
analyser.call