require 'test_helper'

class Accounting::EntryTest < ActiveModel::TestCase
  include ActiveModel::Lint::Tests

  setup do
    @model = Accounting::Entry.new
  end
end
