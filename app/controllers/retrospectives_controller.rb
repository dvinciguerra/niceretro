# frozen_string_literal: true

class RetrospectivesController < ApplicationController
  def index
    @retrospectives = Retrospective.all
  end

  def new
    @retrospective = Retrospective.new
  end

  def create
    @retrospective = Retrospective.new(retrospectives_params)

    return unless @retrospective.save

    redirect_to retrospectives_path
  end

  def edit
    @retrospective = Retrospective.find(params[:id])
  end

  def update
    @retrospective = Retrospective.find(params[:id])
    if @retrospective.update_attributes(retrospectives_params)
      redirect_to retrospectives_path
    else
      render :edit
    end
  end

  def destroy
    @retrospective = Retrospective.find(params[:id])
    @retrospective.destroy

    return unless @retrospective.destroyed?

    redirect_to retrospectives_path
  end

  def show
    @retrospective = Retrospective.find(params[:id])
    demands
    doubts
    positive_topics
    negative_topics
  end

  private

  def demands
    @demands = @retrospective.demands.order(:id)
    @demand = Demand.new
  end

  def doubts
    @doubts = @retrospective.doubts.order(:id)
    @doubt = Doubt.new
  end

  def positive_topics
    @positive_topics = @retrospective.positive_topics.order(:id)
    @positive_topic = PositiveTopic.new
  end

  def negative_topics
    @negative_topics = @retrospective.negative_topics.order(:id)
    @negative_topic = NegativeTopic.new
  end

  def retrospectives_params
    params.require(:retrospective).permit(:title, :date, :room)
  end
end
