class Accounting::EntriesController < ApplicationController
  before_action :set_accounting_entry, only: [:show, :edit, :update, :destroy]

  # GET /accounting/entries
  # GET /accounting/entries.json
  def index
    @accounting_entries = Accounting::Entry.all
  end

  # GET /accounting/entries/1
  # GET /accounting/entries/1.json
  def show
  end

  # GET /accounting/entries/new
  def new
    @accounting_entry = Accounting::Entry.new
  end

  # GET /accounting/entries/1/edit
  def edit
  end

  # POST /accounting/entries
  # POST /accounting/entries.json
  def create
    @accounting_entry = Accounting::Entry.new(accounting_entry_params)

    respond_to do |format|
      if @accounting_entry.save
        format.html { redirect_to @accounting_entry, notice: 'Entry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @accounting_entry }
      else
        format.html { render action: 'new' }
        format.json { render json: @accounting_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounting/entries/1
  # PATCH/PUT /accounting/entries/1.json
  def update
    respond_to do |format|
      if @accounting_entry.update(accounting_entry_params)
        format.html { redirect_to @accounting_entry, notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @accounting_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting/entries/1
  # DELETE /accounting/entries/1.json
  def destroy
    @accounting_entry.destroy
    respond_to do |format|
      format.html { redirect_to accounting_entries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting_entry
      @accounting_entry = Accounting::Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accounting_entry_params
      params[:accounting_entry]
    end
end
