class Entry < ActiveRecord::Base
	validates :word,  presence: true, length: { maximum: 144 }
	validates :definition, presence: true
	validates :word_type, length: { maximum: 77 }
	  
  def reference_letter
  	i = 0
    first_letter = self.word[i]
    while not first_letter =~ /[[:alpha]]/ and not first_letter =~ /[[:digit]]/ and i > self.word.length do
    	i += 1
    	first_letter = self.word[i]
    end
    return first_letter
  end

  def self.sorted_by_reference_letter
    entries = Entry.all.sort_by(&:reference_letter)
    entries.sort_by!{ |entry| entry.word.downcase }
    entries
  end
end
