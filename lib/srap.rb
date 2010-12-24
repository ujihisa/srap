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

  def with(initials)
    p initials
    run
  end

  def run
    p :cool
  end
end
