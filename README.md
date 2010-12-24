# Srap: strscan wrapper

Srap helps you write tokenizer quickly and easily with less idioms.

before

    require 'strscan'
    s = StringScanner.new c
    in_comment = false
    a_stack = []
    memo = []
    until s.eos?
      memo <<
        case
        when s.scan(/.../)
          [:aaa, s[0]]
        ...
    end
    memo #=> that's what you want

after

    require 'srap'
    Srap(c).with(in_comment: false, a_stack: []) {|s|
      case
      when s.scan(/.../)
        [:aaa, s[0]]
      ...
    } #=> that's what you want

## install

    $ gem install srap

There's no dependency RubyGems library.

## Author

Tatsuhiro Ujihisa
