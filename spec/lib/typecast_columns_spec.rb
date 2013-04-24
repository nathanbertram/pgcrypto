require 'spec_helper'

describe 'non string columns' do
  it 'should typecast non string columns appropriately' do
    hydrogen = Element.create!(name: 'Hydrogen', atomic_number: 1)
    helium = Element.create!(name: 'Helium', atomic_number: 2)
    t = Element.arel_table
    expect(Element.where(t[:atomic_number].gt(1))).to eq([helium])
  end
end
