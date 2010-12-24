require 'strscan'

def Srap(code, &block)
  if block
    Srap.new(code).run
  else
    Srap.new(code)
  end
end

class Srap
  def initialize(code)
    @code = code
  end

  def with(initials, &block)
    @initials = initials
    run(&block)
  end

  def run(&block)
    s = StringScanner.new(@code)
    memo = []
    until s.eos?
      memo << block.call(s)
    end
    memo.inject([]) {|m, token|
      if /\!$/ =~ token[0].to_s && m[-1] && m[-1][0] == token[0]
        m[-1][1] << token[1]
        m
      else
        m.push token
      end
    }.map {|name, value|
      [name.to_s.sub(/\!$/, '').to_sym, value]
    }
  end
end
