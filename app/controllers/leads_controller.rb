class LeadsController < ApplicationController
  load_and_authorize_resource

  def create
    @lead = Lead.new lead_params
    if @lead.save
      cookies[:saved_lead] = true
      redirect_to root_path, notice: "Saved successfully!"
    else
      redirect_to root_path, alert: "Failed to save"
    end
  end

  private
    def lead_params
      params.require(:lead).permit(:email)
    end
end
