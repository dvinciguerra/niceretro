# frozen_string_literal: true

class DoubtsController < ApplicationController
  before_action :get_retrospective_id
  respond_to :html, :js

  def create
    @retrospective = Retrospective.find(@retrospective_id)
    @doubt = @retrospective.doubts.build(doubts_params)
    @doubt.save
  end

  def destroy
    @doubt = Doubt.find(params[:id])
    @doubt.destroy
  end

  private

  def doubts_params
    params.require(:doubt).permit(:description)
  end

  def get_retrospective_id
    @retrospective_id = params[:retrospective_id]
  end
end
