require 'spec_helper'

describe Locale do
  subject { build(:locale) }

  it { should be_valid }
end
