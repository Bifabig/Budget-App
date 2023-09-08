require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject { Entity.new(name: 'E1', amount: 50) }
  before { subject.save }

  describe 'validate the entity model' do
    it { should allow_value('E1').for(:name) }
    it { should allow_value(50).for(:amount) }

    it 'All entity attributes must be present' do
      expect(subject.name).to eq('E1')
      expect(subject.amount).to eq(50)
    end

    describe 'check association' do
      it { should belong_to(:author) }
      it { should have_many(:groups) }
    end
  end
end
