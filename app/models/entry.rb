class Entry < ActiveRecord::Base
	validates :word,  presence: true, length: { maximum: 144 }
	validates :definition, presence: true
	validates :word_type, length: { maximum: 77 }
  
end
