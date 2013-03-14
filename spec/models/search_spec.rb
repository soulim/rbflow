require 'spec_helper'

describe Search do
  let(:resource) { double('resource') }

  subject { Search.new(resource) }

  describe '#find' do
    it 'should perform basic search on resource' do
      resource.should_receive(:basic_search)

      subject.perform('foo')
    end
  end
end
