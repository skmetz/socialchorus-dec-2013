require 'delegate'

class Fixnum
  def to_bottle_num
    case self
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    else
      BottleNumber
    end.new(self)
  end
end

class BottleNumber < SimpleDelegator

  def to_s
   "#{inventory} #{container}"
  end

  def inventory
    __getobj__.to_s
  end

  def container
    'bottles'
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def pronoun
    if self == 1
      'it'
    else
      'one'
    end
  end

  def pred
    __getobj__.pred.to_bottle_num
  end
end

class BottleNumber0 < BottleNumber
  def inventory
    'no more'
  end

  def action
    "Go to the store and buy some more"
  end

  def pred
    99.to_bottle_num
  end
end

class BottleNumber1 < BottleNumber
  def container
    'bottle'
  end

  def pronoun
    'it'
  end
end

