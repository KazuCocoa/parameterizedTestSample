# coding: utf-8

class Calculator

  def self.calculator arithmetic, num1, num2
    case arithmetic
    when 'plus'
      num1 + num2
    when 'sub'
      num1 - num2
    end
  end

end
