# frozen_string_literal: true

require 'rails_helper'

describe DemandsController do
  let(:retrospective) { Retrospective.create(title: 'retrotest', date: '25/11/2015', room: 4) }

  describe 'POST #create' do
    before do
      post :create,
           demand: { description: 'demand' },
           retrospective_id: retrospective.id
    end

    it { is_expected.to redirect_to retrospective_path(retrospective.id) }
  end

  describe 'DELETE #destroy' do
    let(:demand) { Demand.create(description: 'demand1') }
    before { delete :destroy, retrospective_id: retrospective.id, id: demand.id }

    it { is_expected.to redirect_to retrospective_path(retrospective.id) }
  end
end
