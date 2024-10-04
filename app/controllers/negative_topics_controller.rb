# frozen_string_literal: true

class NegativeTopicsController < ApplicationController
  before_action :get_retrospective_id
  respond_to :html, :js

  def create
    @retrospective = Retrospective.find(@retrospective_id)
    @negative_topic = @retrospective.negative_topics.build(negative_topics_params)
    @negative_topic.save
  end

  def destroy
    @negative_topic = NegativeTopic.find(params[:id])
    @negative_topic.destroy
  end

  private

  def negative_topics_params
    params.require(:negative_topic).permit(:description)
  end

  def get_retrospective_id
    @retrospective_id = params[:retrospective_id]
  end
end
