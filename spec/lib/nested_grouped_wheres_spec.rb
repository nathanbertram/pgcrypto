require 'spec_helper'

describe 'nested grouped wheres' do
  it 'works with nested parens' do
    Element.create!(name: 'Hydrogen', atomic_number: 1)
    helium = Element.create!(name: 'Helium', atomic_number: 2)
    Element.create!(name: 'Lithium', atomic_number: 3)
    Element.create!(name: 'Beryllium', atomic_number: 4)

    t = Element.arel_table
    atomic_number_condition = Arel::Nodes::Grouping.new(Arel::Nodes::And.new([
      t[:atomic_number].gt(1),
      t[:atomic_number].lt(4)
    ]))
    name_condition = Arel::Nodes::Grouping.new(Arel::Nodes::And.new([
      t[:name].not_eq('Lithium')
    ]))
    elements = Element.where(Arel::Nodes::And.new([atomic_number_condition, name_condition]))
    expect(elements).to eq([helium])
  end
end
