require_relative "../models/entry.rb"

RSpec.describe Entry do 

	describe "attributes" do
        
	end

	describe "#to_s" do
        it "prints an entry as a string" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        	expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"

        	expect(entry.to_s).to eq(expected_string)
		end
    end
end