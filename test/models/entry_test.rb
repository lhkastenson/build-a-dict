require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  def setup
    @entry = Entry.new(word: "Example Word", definition: "Example Definition", origin: "Example Origin", author: "Example Author", created_at: 1.day.ago, updated_at: Time.now, example: "Example example", word_type: "Example word_type")
    @entry_two = Entry.new(word: "Example Word but second", definition: "Example Definition", origin: "Example Origin", author: "Example Author", created_at: 1.day.ago, updated_at: Time.now, example: "Example example", word_type: "Example word_type")
    @entry_three = Entry.new(word: "ZZ Example Word but last", definition: "Example Definition", origin: "Example Origin", author: "Example Author", created_at: 1.day.ago, updated_at: Time.now, example: "Example example", word_type: "Example word_type")
  end

  test "should be valid" do
    assert @entry.valid?
  end

  test "word should be present" do
  	@entry.word = ""
  	assert_not @entry.valid?
  end

  test "word should be 144 or less characters" do
  	@entry.word = "a" * 145
  	assert_not @entry.valid?
  end

  test "definition should be present" do
  	@entry.definition = ""
  	assert_not @entry.valid?
  end

  test "word_type should be 77 or less characters" do
    @entry.word_type = "a" * 78
    assert_not @entry.valid?
  end

  test "reference letter should be present" do
    assert @entry.reference_letter != nil
  end

  test "reference letter should be exactly 1 character" do
  	assert @entry.reference_letter.length == 1
  end

  test "reference letter should be an actual letter or number" do
  	assert @entry.reference_letter =~ /[[:alpha:]]/ or @entry.reference_letter =~ /[[:digit]]/
  end

  test "sorted_by_reference_letter should be sorted correctly" do
  	sorted_entries = @entries.sorted_by_reference_letter
  	assert sorted_entries[0] == @entry and sorted_entries[1] == @entry_two and sorted_entries[2] == @entry_three
  end
end
