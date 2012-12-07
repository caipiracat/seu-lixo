require 'spec_helper'

describe Garbage do
  subject { build(:garbage) }

  it { should be_valid }
end
