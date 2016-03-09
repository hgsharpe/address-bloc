<<<<<<< HEAD
require_relative "../models/address_book.rb"

RSpec.describe AddressBook do  
   context "attributes" do
     it "should respond to entries" do
       book = AddressBook.new
       expect(book).to respond_to(:entries)
     end

     it "should initialize entries as an array" do
       book = AddressBook.new
       expect(book.entries).to be_a(Array)
     end

     it "should initialize entries as empty" do
       book = AddressBook.new
       expect(book.entries.size).to eq 0
     end
   end

   context "#remove_entry" do
     it "removes an entry using the name, phone_number, and email address" do
       book = AddressBook.new
       book.add_entry('Henry Lovelace', '010.012.1885', 'henry.lovelace@lovelace.com')

       name = "Ada Lovelace"
       phone_number = "010.012.1815"
       email_address = "augusta.king@lovelace.com"
       book.add_entry(name, phone_number, email_address)

       expect(book.entries.size).to eq 2
       book.remove_entry(name, phone_number, email_address)
      end

   end

   context "#add_entry" do
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
=======
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
>>>>>>> 21-csvs
end