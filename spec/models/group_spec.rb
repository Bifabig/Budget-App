require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { Group.new(name: 'G1', icon: 'avatar') }
  before { subject.save }

  describe 'validate the group model' do
    it { should allow_value('G1').for(:name) }
    it { should allow_value('avatar').for(:icon) }

    it 'All group attributes must be present' do
      expect(subject.name).to eq('G1')
      expect(subject.icon).to eq('avatar')
    end

    describe 'check association' do
      it { should belong_to(:user) }
      it { should have_many(:entities) }
    end
  end
end
