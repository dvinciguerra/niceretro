# frozen_string_literal: true

require 'rails_helper'

describe RetrospectivesController do
  let(:retrospective) { Retrospective.create(title: 'retrotest', date: '25/11/2015', room: 4) }

  describe 'GET #index' do
    before { get :index }

    it 'assigns all retrospectives to @retrospectives' do
      expect(assigns(:retrospectives)).to eq([retrospective])
    end

    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :index }
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new retrospective to @retrospective' do
      expect(assigns(:retrospective)).to be_a_new(Retrospective)
    end

    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template(:new) }
  end

  describe 'POST #create' do
    before do
      post :create,
           retrospective: { title: 'retro1', date: '25/11/2015', room: 1 }
    end

    it { is_expected.to redirect_to retrospectives_path }
  end

  describe 'GET #edit' do
    before { get :edit, id: retrospective.id }

    it 'assigns a retrospective to be edited to @retrospective' do
      expect(assigns(:retrospective)).to eq(retrospective)
    end

    it { is_expected.to render_template :edit }
  end

  describe 'PUT #update' do
    before do
      put :update,
          id: retrospective.id,
          retrospective: { title: 'retro2', date: '25/11/2015', room: 1 }
    end

    it 'should have the edited data' do
      expect(retrospective.reload.title).to eq('retro2')
    end

    it { is_expected.to redirect_to retrospectives_path }
  end

  describe 'DELETE #destroy' do
    before { delete :destroy, id: retrospective.id }

    it { is_expected.to redirect_to retrospectives_path }
  end
end
