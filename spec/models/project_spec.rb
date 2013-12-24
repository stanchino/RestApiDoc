require 'spec_helper'

describe Project do
  context "relations" do
    it { should have_many(:suites) }
  end
end
