require 'spec_helper'

describe Request do
  context "relations" do
    it { should belong_to(:page) }
    it { should belong_to(:entity) }
    it { should have_many(:assertions) }
  end
end
