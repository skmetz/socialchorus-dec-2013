require 'delegate'

class Fixnum
  def to_container_number
    begin
      Object.const_get("ContainerNumber#{self}")
    rescue NameError
      ContainerNumber
    end.new(self)
  end
end

class ContainerNumber < SimpleDelegator
  def pred
    __getobj__.pred.to_container_number
  end

  def to_s
    "#{inventory} #{container}"
  end

  def container
    'bottles'
  end

  def inventory
    __getobj__.to_s
  end

  def action
    'Take one down and pass it around'
  end
end

class ContainerNumber0 < ContainerNumber
  def inventory
    'no more'
  end

  def action
    'Go to the store and buy some more'
  end

  def pred
    99.to_container_number
  end
end

class ContainerNumber1 < ContainerNumber
  def container
    'bottle'
  end

  def action
    'Take it down and pass it around'
  end
end


require 'delegate'

class Fixnum
  def to_container_number
    begin
      Object.const_get("ContainerNumber#{self}")
    rescue NameError
      ContainerNumber
    end.new(self)
  end
end

class ContainerNumber < SimpleDelegator
  def pred
    __getobj__.pred.to_container_number
  end

  def to_s
    "#{inventory} #{container}"
  end

  def container
    'bottles'
  end

  def inventory
    __getobj__.to_s
  end

  def action
    'Take one down and pass it around'
  end
end

class ContainerNumber0 < ContainerNumber
  def inventory
    'no more'
  end

  def action
    'Go to the store and buy some more'
  end

  def pred
    99.to_container_number
  end
end

class ContainerNumber1 < ContainerNumber
  def container
    'bottle'
  end

  def action
    'Take it down and pass it around'
  end
end

puts "\n\n"
b0 = ContainerNumber0.new(0)
b1 = ContainerNumber1.new(1)
b7 = ContainerNumber.new(7)
puts "ContainerNumber0 #{b0.inventory} #{b0.container}"
puts "ContainerNumber1 #{b1.inventory} #{b1.container}"
puts "ContainerNumber7 #{b7.inventory} #{b7.container}"
puts "pred of ContainerNumber1 #{b1.pred.to_s}"
puts "pred of ContainerNumber0 #{b0.pred.to_s}"
puts "\n\n"
