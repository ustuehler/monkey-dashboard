class Accounting::Entry
  include ActiveModel::Model

  def self.ledger
    Monkey::Accounting.default_ledger
  end

  def self.all
    ledger.entries.map { |e| new e }
  end

  # Returns the entry identified by +param+ or +nil+.
  # @param param [String] entry ID as a string
  # @returns [Entry,nil] entry found or +nil+
  def self.find(param)
    all.detect { |e| e.to_param == param }
  end

  def self.count
    all.size
  end

  attr_reader :entry

  def initialize(entry_or_attributes = nil)
    if entry_or_attributes.nil?
      @entry = Monkey::Accounting::Entry.new(Date.today)
    elsif entry_or_attributes.is_a?(Monkey::Accounting::Entry)
      @entry = entry_or_attributes
    else
      date = entry_or_attributes[:date] || Date.today
      effective_date = entry_or_attributes[:effective_date]
      flag = entry_or_attributes[:flag]
      code = entry_or_attributes[:code]
      description = entry_or_attributes[:description]
      transactions = entry_or_attributes[:transactions] || []
      @entry = Monkey::Accounting::Entry.new(
        date, effective_date, flag, code, description, transactions)
    end
  end

  def destroy
    self.class.ledger.entries >> @entry
    self.class.ledger.save!
    true
  end

  def save
    self.class.ledger.entries << @entry
    self.class.ledger.save!
    true
  end

  def update(attributes = {})
    true
  end

  def persisted?
    !@entry.id.nil?
  end

  def to_param
    if persisted?
      @entry.id.to_s
    else
      nil
    end
  end
end
