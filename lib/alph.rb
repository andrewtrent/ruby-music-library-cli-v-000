class Alpher
  attr_accessor :list, :attribute


  def initialize(klass, attribute)
    @list = klass.all
    @attribute = attribute
  end

  def betize(klass, attribute)
    cuneiform = Alpher.new(klass, attribute)
    cuneiform.beta
  end

  def alpha(*args)
    args.join('.')
  end

  def beta
    @list.sort_by {|obj| alpha.send(obj, attribute)}
  end

end
