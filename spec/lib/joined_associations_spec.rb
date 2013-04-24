require 'spec_helper'

describe 'Joined assocations' do
  it 'should decrypt encrypted columns on joined associations' do
    chemical = Chemical.create!(secret_formula: 'whale blubber')
    element = chemical.elements.create!
    Element.joins(:chemical).where(chemicals: { secret_formula: 'whale blubber' }).should include(element)
  end
end
