# frozen_string_literal: true

class DemandsController < ApplicationController
  before_action :get_retrospective_id
  respond_to :html, :js

  def create
    @retrospective = Retrospective.find(@retrospective_id)
    @demand = @retrospective.demands.build(demands_params)
    @demand.save
  end

  def destroy
    @demand = Demand.find(params[:id])
    @demand.destroy
  end

  def update_status
    @demand = Demand.find(params[:id])
    @demand.status = !@demand.status
    @demand.save
  end

  private

  def demands_params
    params.require(:demand).permit(:description, :user, :status)
  end

  def get_retrospective_id
    @retrospective_id = params[:retrospective_id]
  end
end
