require 'rails_helper'

describe Card, type: :model do
  it { is_expected.to validate_presence_of :value }
  it { is_expected.to validate_presence_of :image }
  it { is_expected.to validate_presence_of :suit }
  it { is_expected.to validate_presence_of :code }
  it { is_expected.to validate_uniqueness_of :code }
end
