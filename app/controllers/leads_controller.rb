class LeadsController < ApplicationController
  before_action :set_lead, only: %i[ show edit update destroy ]

  # GET /leads or /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1 or /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads or /leads.json
  def create
    @lead = Lead.new(contact_params)
    # @lead.contact_name = params[:full_name]
    # @lead.company_name = params[:company_name]
    # @lead.email = params[:email]
    # @lead.phone = params[:phone]
    # @lead.project_name = params[:project_name]
    # @lead.project_description = params[:project_description]
    # @lead.department = params[:department]
    # @lead.message = params[:message]
    # @lead.attached_file = params[:attached_file]
    # @lead.date = params[:date]
    # @lead = Lead.new(contact_params)

    respond_to do |format|
      if @lead.save
        format.html { redirect_to lead_url(@lead), notice: "Lead was successfully created." }
        format.json { render :show, status: :created, location: @lead }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1 or /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to lead_url(@lead), notice: "Lead was successfully updated." }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1 or /leads/1.json
  def destroy
    @lead.destroy

    respond_to do |format|
      format.html { redirect_to leads_url, notice: "Lead was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:leads).permit(:full_name, :company_name, :email, :phone, :project_name, :project_description, :department, :message)
    end
end
