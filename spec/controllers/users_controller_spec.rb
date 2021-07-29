require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe '#create' do
    def subject
      post users_path, params: { user: params }
    end

    context 'when email is whitelisted' do
      let(:params) { { email: 'a@a.com', password: '1234', name: 'Chuck Norris' } }

      it 'creates the user' do
        expect { subject }.to change(User, :count).by(1)
      end

      it { is_expected.to redirect_to account_path }
    end

    context 'when email is not whitelisted' do
      let(:params) { { email: 'z@a.com', password: '1234', name: 'Chuck Norris' } }

      it 'does not create the user' do
        expect { subject }.to change(User, :count).by(0)
      end

      it 'renders validation error' do
        subject
        expect(response.body).to have_content('z@a.com rejected')
      end
    end
  end
end
