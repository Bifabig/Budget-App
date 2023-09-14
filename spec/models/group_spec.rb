require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.new(name: 'biftu', email: 'biftu@example.com', password: 'password') }
  subject { Group.new(name: 'G1', author: user) }
  before do
    subject.icon.attach(io: File.open(Rails.root.join('spec', 'models', 'files', 'test.png')), filename: 'test.png',
                        content_type: 'image/png')
    subject.save
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    describe 'check association' do
      it 'belongs to a user' do
        expect(subject).to respond_to(:author)
      end

      it 'has many entities' do
        expect(subject).to respond_to(:entities)
      end
    end
  end
end
