require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe '#index' do
    def do_request
      get root_path
    end

    specify do
      do_request

      expect(response.status).to eq 200
    end
  end

  describe '#pricing' do
    def do_request
      get pricing_path
    end

    specify do
      do_request

      expect(response.status).to eq 200
    end
  end
end
