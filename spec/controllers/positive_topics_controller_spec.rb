# frozen_string_literal: true

require 'rails_helper'

describe PositiveTopicsController do
  let(:retrospective) { Retrospective.create(title: 'retrotest', date: '25/11/2015', room: 4) }

  describe 'POST #create' do
    before do
      post :create,
           positive_topic: { description: 'positive_topic' },
           retrospective_id: retrospective.id
    end

    it { is_expected.to redirect_to retrospective_path(retrospective.id) }
  end

  describe 'DELETE #destroy' do
    let(:positive_topic) { PositiveTopic.create(description: 'positive_topic_1') }
    before { delete :destroy, retrospective_id: retrospective.id, id: positive_topic.id }

    it { is_expected.to redirect_to retrospective_path(retrospective.id) }
  end
end
