# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RemoteFormErrorsHelper do
  describe '#errors_for' do
    let(:object) { PositiveTopic.create }

    it 'returns the html formatted error for the invalid attribute' do
      expect(helper.errors_for(object, :description))
        .to eq('<small class="ls-help-message">O campo Description não pode ficar em branco</small>')
    end
  end
end
