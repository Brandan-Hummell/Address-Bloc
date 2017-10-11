require_relative 'entry'

class AddressBook
    attr_reader :entries

    def initialize
        @entries = []
    end

    def add_entry(name, phone_number, email)
        index = 0
        entries.each do |entry|
            if (name < entry.name)
                break
            end
        index += 1
        end
    entries.insert(index, Entry.new(name, phone_number, email))
    end

    def remove_entry(name, phone_number, email)
        entries.each_with_index do |entry, index|
            if (name == entry.name && phone_number = entry.phone_number && email = entry.email)
                entries.delete_at(index)
            end
        end
    end

    def binary_search(name)
      lower = 0
      upper = entries.length - 1
 
      while lower <= upper
        mid = (lower + upper) / 2
        mid_name = entries[mid].name
 
       # #4
        if name == mid_name
          return entries[mid]
        elsif name < mid_name
          upper = mid - 1
        elsif name > mid_name
          lower = mid + 1
        end
      end
 
      return nil
    end

end