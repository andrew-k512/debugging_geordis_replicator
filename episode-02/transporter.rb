class Transporter

  def initialize(enterprise)
    @enterprise = enterprise
    @power = false
    connect_to_power
  end

  def connect_to_power
    @power = @enterprise.reactor.on
  end
# 1. The next step would be to put binding.pry in th energize method.
# 2. Check the @power instance variable.
# 3. We determined the problem was with the reactor.on method in the reactor file.
  def energize(obj:, from:, to:)
    return unless @power

    if @enterprise.reactor.draw_power(3)
      to.contents << from.contents.delete(obj)
      return obj
    end
  end

end
