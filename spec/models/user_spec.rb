require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Biftu') }
  before { subject.save }

  describe 'validate the user model' do
    it { should allow_value('Biftu').for(:name) }

    it 'All user attributes must be present' do
      expect(subject.name).to eq('Biftu')
    end

    describe 'check association' do
      it { should have_many(:groups) }
      it { should have_many(:entities) }
    end
  end
end
