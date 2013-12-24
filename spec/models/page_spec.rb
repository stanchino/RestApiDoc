require 'spec_helper'

describe Page do
  context "relations" do
    it { should belong_to(:suite) }
  end
end
