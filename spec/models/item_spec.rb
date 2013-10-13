require 'spec_helper'

describe Item do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:secure_key) }

  it { should validate_uniqueness_of(:secure_key) }


end