require_relative '../models/address_book.rb'

RSpec.describe AddressBook do

  let(:book) { AddressBook.new}

  describe "attributes" do
    it "responds to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

      expect(book.entries.size).to eq 1
    end

    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

  context "#import_from_csv"  do
    it "imports the correct number of entries" do
     
      book.import_from_csv("entries.csv")
      book_size = book.entries.size
     
      expect(book_size).to eq 5
    end
    
    it "imports the 1st entry" do
      book.import_from_csv('entries.csv')
      entry_one = book.entries[0]

      expect(entry_one.name).to eq "Bill"
      expect(entry_one.phone_number).to eq "555-555-4854"
      expect(entry_one.email).to eq "bill@blocmail.com"
    end

    it "imports the 2nd entry" do
      book.import_from_csv('entries.csv')
      entry_one = book.entries[1]

      expect(entry_one.name).to eq "Bob"
      expect(entry_one.phone_number).to eq "555-555-5415"
      expect(entry_one.email).to eq "bob@blocmail.com"
    end

    it "imports the 3rd entry" do
      book.import_from_csv('entries.csv')
      entry_one = book.entries[2]

      expect(entry_one.name).to eq "Joe"
      expect(entry_one.phone_number).to eq "555-555-3660"
      expect(entry_one.email).to eq "joe@blocmail.com"
    end

    it "imports the 4th entry" do
      book.import_from_csv('entries.csv')
      entry_one = book.entries[3]

      expect(entry_one.name).to eq "Sally"
      expect(entry_one.phone_number).to eq "555-555-4646"
      expect(entry_one.email).to eq "sally@blocmail.com"
    end

    it "imports the first entry" do
      book.import_from_csv('entries.csv')
      entry_one = book.entries[4]

      expect(entry_one.name).to eq "Sussie"
      expect(entry_one.phone_number).to eq "555-555-2036"
      expect(entry_one.email).to eq "sussie@blocmail.com"
    end
  end
  
  describe "#binary_search" do
    it "searches AddressBook for a non-existent entry" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Dan")
      expect(entry).to be_nil
    end
    
    it "searches AddressBook for Bill" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Bill")
      expect(entry).to be_a Entry
    end
    
    it "searches AddressBook for Bob" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Bob")
      expect(entry).to be_a Entry
    end
    
    it "searches AddressBook for Joe" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Joe")
      expect(entry).to be_a Entry
    end
    
    it "searches AddressBook for Sally" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Sally")
      expect(entry).to be_a Entry
    end
    
    it "searches AddressBook for Sussie" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("sussie")
      expect(entry).to be_nil
    end
    
    it "searches AddressBook for Billy" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Billy")
      expect(entry).to be_nil
    end
  end
end