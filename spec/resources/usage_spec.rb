require 'spec_helper'

describe DeepL::Resources::Usage do
  subject { DeepL::Resources::Usage.new(3, 5, nil, nil) }

  describe '#initialize' do
    context 'When building a basic object' do
      it 'should create a resource' do
        expect(subject).to be_a(DeepL::Resources::Usage)
      end

      it 'should assign the attributes' do
        expect(subject.character_count).to eq(3)
        expect(subject.character_limit).to eq(5)
      end

      it 'should not exceed the quota' do
        expect(subject.quota_exceeded?).to be_falsey
      end
    end

    context 'When building a quota exceeded object' do
      subject { DeepL::Resources::Usage.new(5, 5, nil, nil) }

      it 'should exceed the quota' do
        expect(subject.quota_exceeded?).to be_truthy
      end
    end
  end
end
