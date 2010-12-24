require_relative '../lib/srap'
describe 'Srap()' do
  it 'is awesome' do
    code = <<-EOH
    asjkdl
    jasdfkl
    # asdjkl
    iadsjfk #fjdaskl
    asdjfkl
    EOH
    Srap(code).with(in_comment: false) {|s|
      case
      when s.scan(/#.*/)
        [:comment, s[0]]
      when s.scan(/./m)
        [:normal!, s[0]]
      end
    }.should == [[:normal, "    asjkdl\n    jasdfkl\n    "], [:comment, "# asdjkl"], [:normal, "\n    iadsjfk "], [:comment, "#fjdaskl"], [:normal, "\n    asdjfkl\n"]]
  end
end
