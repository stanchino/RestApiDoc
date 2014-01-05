require 'spec_helper'

describe Assertion do
  context "relations" do
    it { should belong_to(:request) }
  end
end
