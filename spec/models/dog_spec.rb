require 'spec_helper'

describe Dog do
  it { should belong_to(:pedigree) }
end
