module Concerns::Findable

##logic originally developed in Song class

  def find_by_name(name)

    ##there must be a cleaner way to do this
    (self.all.map do |x|
      x if x.name == name
    end).pop
  end

  def find_or_initialize_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.new(name)
    end
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create(name)
    end
  end



end
