# frozen_string_literal: true

class PositiveTopicsController < ApplicationController
  include RemoteFormErrorsHelper

  before_action :get_retrospective_id
  respond_to :html, :js

  def create
    @retrospective = Retrospective.find(@retrospective_id)
    @positive_topic = @retrospective.positive_topics.build(positive_topics_params)
    @positive_topic.save
  end

  def destroy
    @positive_topic = PositiveTopic.find(params[:id])
    @positive_topic.destroy
  end

  def edit
    @retrospective = Retrospective.find(@retrospective_id)
    @positive_topic = PositiveTopic.find(params[:id])
  end

  def update
    @positive_topic = PositiveTopic.find(params[:id])
    @positive_topic.update_attributes(positive_topics_params)
  end

  private

  def positive_topics_params
    params.require(:positive_topic).permit(:description)
  end

  def get_retrospective_id
    @retrospective_id = params[:retrospective_id]
  end
end
