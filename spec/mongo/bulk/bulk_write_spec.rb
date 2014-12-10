require 'spec_helper'

describe Mongo::BulkWrite do

  context 'ordered' do

    before do
      authorized_collection.find.remove_many
    end

    let(:bulk) do
      described_class.new(operations, options, authorized_collection)
    end

    let(:options) do
      { ordered: true }
    end

    it_behaves_like 'a bulk write object'
  end

  context 'unordered' do

    before do
      authorized_collection.find.remove_many
    end

    let(:bulk) do
      described_class.new(operations, options, authorized_collection)
    end

    let(:options) do
      { ordered: false }
    end

    it_behaves_like 'a bulk write object'
  end
end
