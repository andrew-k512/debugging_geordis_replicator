class Transporter

  def initialize(enterprise)
    @enterprise = enterprise
    @power = false
    connect_to_power
  end

  def connect_to_power
    @power = @enterprise.reactor.on
  end

# We put pry in the energize method before the first return. It looks different than
# energize method in other files.
  def energize(obj:, from:, to:)
    return unless @power
    # return

    if @enterprise.reactor.draw_power(3)
      to.contents << from.contents.delete(obj)
      return obj
    end
  end

end
