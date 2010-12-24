require_relative '../lib/srap'
describe 'Srap()' do
  it 'is awesome' do
    Srap(<<-EOH).with(in_comment: false)
    asjkdl
    jasdfkl
    # asdjkl
    iadsjfk #fjdaskl
    asdjfkl
    EOH
  end
end
