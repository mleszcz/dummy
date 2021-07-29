require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_inclusion_of(:email).in_array(User::EMAIL_WHITELIST) }

    describe 'email whitelist validator' do
      subject { build(:user, email: email) }

      before { create(:email_whitelist, email: 'a@a.com') }

      context 'when email is whitelisted' do
        let(:email) { 'a@a.com' }

        it { is_expected.to be_valid }
      end

      context 'when email is not whitelisted' do
        let(:email) { 'r@nd.om' }

        it { is_expected.not_to be_valid }

        it 'adds validation error message' do
          subject.valid?
          expect(subject.errors.where(:email).first.message).to eq('r@nd.om rejected')
        end
      end
    end
  end
end
