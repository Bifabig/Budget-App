require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { User.new(name: 'biftu', email: 'biftu@example.com', password: 'password') }
  subject { Entity.new(name: 'E1', amount: 50, author: user) }
  before { subject.save }

  describe 'validate the entity model' do
    it { should allow_value('E1').for(:name) }
    it { should allow_value(50).for(:amount) }

    it 'All entity attributes must be present' do
      expect(subject.name).to eq('E1')
      expect(subject.amount).to eq(50)
    end

    describe 'check association' do
      it 'belongs to a user' do
        expect(subject).to respond_to(:author)
      end

      it 'has many groups' do
        expect(subject).to respond_to(:groups)
      end
    end
  end
end
