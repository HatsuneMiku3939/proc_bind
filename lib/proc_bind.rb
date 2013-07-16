class Proc
  def bind(pos, *values)
    Proc.new { |*arguments| call(*inject_value_to_arguments(pos, values, arguments)) }
  end

  def inject_value_to_arguments(pos, values, arguments)
    size = arguments.size
    case pos
    when 1       then values + arguments
    when 2..size then arguments[0, pos] + values + arguments[pos, size]
    when size+1  then arguments + values
    else ArgumentError.new("wrong position of argument (#{pos} for #{arguments})")
    end
  end
end
