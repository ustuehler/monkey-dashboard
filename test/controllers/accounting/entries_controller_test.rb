require 'test_helper'

class Accounting::EntriesControllerTest < ActionController::TestCase
  setup do
    assert Monkey.config.accounting.default_ledger_file.include?('tmp')
    File.open(Monkey.config.accounting.default_ledger_file, 'w') do |f|
      f.write File.read("#{fixture_path}/accounting/entries.dat")
    end
    Monkey::Accounting.instance_variable_set :@ledger, nil
    @accounting_entry = accounting_entries(0)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounting_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounting_entry" do
    assert_difference('Accounting::Entry.count') do
      post :create, accounting_entry: {  }
    end

    assert_redirected_to accounting_entry_path(assigns(:accounting_entry))
  end

  test "should show accounting_entry" do
    get :show, id: @accounting_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounting_entry
    assert_response :success
  end

  test "should update accounting_entry" do
    patch :update, id: @accounting_entry, accounting_entry: {  }
    assert_redirected_to accounting_entry_path(assigns(:accounting_entry))
  end

  test "should destroy accounting_entry" do
    assert_difference('Accounting::Entry.count', -1) do
      delete :destroy, id: @accounting_entry
    end

    assert_redirected_to accounting_entries_path
  end

  def accounting_entries(id)
    Accounting::Entry.find id.to_s
  end
end
