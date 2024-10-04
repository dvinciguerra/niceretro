# frozen_string_literal: true

require 'rails_helper'

describe DoubtsController do
  let(:retrospective) { Retrospective.create(title: 'retrotest', date: '25/11/2015', room: 4) }

  describe 'POST #create' do
    before do
      post :create,
           doubt: { description: 'doubt' },
           retrospective_id: retrospective.id
    end

    it { is_expected.to redirect_to retrospective_path(retrospective.id) }
  end

  describe 'DELETE #destroy' do
    let(:doubt) { Doubt.create(description: 'doubt1') }
    before { delete :destroy, retrospective_id: retrospective.id, id: doubt.id }

    it { is_expected.to redirect_to retrospective_path(retrospective.id) }
  end
end
