require_relative '../models/address_book.rb'

RSpec.describe AddressBook do
    describe "attributes" do
        it "responds to entries" do
            book = AddressBook.new
            expect(book).to respond_to(:entries)
        end
    end
 
     it "initializes entries as an array" do
       book = AddressBook.new
       expect(book.entries).to be_an(Array)
     end
 
     it "initializes entries as empty" do
       book = AddressBook.new
       expect(book.entries.size).to eq(0)
     end

    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq(1)
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

    describe "#remove_entry" do
        it "removes only one entry to the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            book.add_entry('Strada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            book.remove_entry('Strada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq(1)
        end
    end

    describe "#binary_search" do
      it "searches AddressBook for a non-existent entry" do
        book = AddressBook.new
        book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        entry = book.binary_search("Eda")
        expect(entry).to be_nil
      end

      it "searches AddressBook for Bill" do
        book = AddressBook.new
        book.add_entry('Bill', '555-555-4854', 'bill@blocmail.com')
        entry = book.binary_search("Bill")
        expect(entry).to be_a Entry
        expect(entry.name).to eq('Bill')
        expect(entry.phone_number).to eq('555-555-4854')
        expect(entry.email).to eq('bill@blocmail.com')
      end
   end

   describe "#iterative_search" do
      it "searches AddressBook for a non-existent entry" do
        book = AddressBook.new
        book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        entry = book.iterative_search("Eda")
        expect(entry).to be_nil
      end

      it "searches AddressBook for Bill" do
        book = AddressBook.new
        book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        book.add_entry('Bill', '555-555-4854', 'bill@blocmail.com')
        entry = book.iterative_search("Bill")
        expect(entry).to be_a Entry
        expect(entry.name).to eq('Bill')
        expect(entry.phone_number).to eq('555-555-4854')
        expect(entry.email).to eq('bill@blocmail.com')
      end
   end
end