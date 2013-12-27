require 'spec_helper'

describe Page do
  context "relations" do
    it { should belong_to(:suite) }
    it { should have_many(:requests) }
  end
end
