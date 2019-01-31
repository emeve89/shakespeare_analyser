require 'spec_helper'

describe ShakespeareAnalyser::UseCases::Utils::ScriptAnalyser do
    describe ".call" do
        it "returns a hash with the name of character as key and number of lines as value ('ALL' lines are rejected)" do

            data = double("data")
            speech1 = double(speech1)
            speech2 = double(speech2)
            speech3 = double(speech3)
            speech4 = double(speech4)
            
            allow(data).to receive(:each)
                .and_yield(speech1)
                .and_yield(speech2)
                .and_yield(speech3)
                .and_yield(speech4)

            allow(speech1).to receive_message_chain(:at_css, :content) { "SPEECH1" }
            allow(speech1).to receive_message_chain(:css, :count) { 2 }
            allow(speech2).to receive_message_chain(:at_css, :content) { "SPEECH2" }
            allow(speech2).to receive_message_chain(:css, :count) { 5 }
            allow(speech3).to receive_message_chain(:at_css, :content) { "ALL" }
            allow(speech3).to receive_message_chain(:css, :count) { 10 } 
            allow(speech4).to receive_message_chain(:at_css, :content) { "SPEECH1" }
            allow(speech4).to receive_message_chain(:css, :count) { 1 }

            results = described_class.call(data: data)
            expect(results.keys).to eq(["SPEECH1", "SPEECH2"])
            expect(results.values).to eq([3, 5])
        end
    end
end