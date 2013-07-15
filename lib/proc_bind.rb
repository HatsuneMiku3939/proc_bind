class Proc
    def bind(pos, value)
        raise ArgumentError.new("wrong position of argument (#{pos} for #{arity})") if parameters.size < pos || pos <= 0

        case [parameters.size, pos]
        when [1, 1] then Proc.new { call(value) }

        when [2, 1] then Proc.new { |a| call(value, a) }
        when [2, 2] then Proc.new { |a| call(a, value) }

        when [3, 1] then Proc.new { |a, b| call(value, a, b) }
        when [3, 2] then Proc.new { |a, b| call(a, value, b) }
        when [3, 3] then Proc.new { |a, b| call(a, b, value) }

        when [4, 1] then Proc.new { |a, b, c| call(value, a, b, c) }
        when [4, 2] then Proc.new { |a, b, c| call(a, value, b, c) }
        when [4, 3] then Proc.new { |a, b, c| call(a, b, value, c) }
        when [4, 4] then Proc.new { |a, b, c| call(a, b, c, value) }

        when [5, 1] then Proc.new { |a, b, c, d| call(value, a, b, c, d) }
        when [5, 2] then Proc.new { |a, b, c, d| call(a, value, b, c, d) }
        when [5, 3] then Proc.new { |a, b, c, d| call(a, b, value, c, d) }
        when [5, 4] then Proc.new { |a, b, c, d| call(a, b, c, value, d) }
        when [5, 5] then Proc.new { |a, b, c, d| call(a, b, c, d, value) }

        when [6, 1] then Proc.new { |a, b, c, d, e| call(value, a, b, c, d, e) }
        when [6, 2] then Proc.new { |a, b, c, d, e| call(a, value, b, c, d, e) }
        when [6, 3] then Proc.new { |a, b, c, d, e| call(a, b, value, c, d, e) }
        when [6, 4] then Proc.new { |a, b, c, d, e| call(a, b, c, value, d, e) }
        when [6, 5] then Proc.new { |a, b, c, d, e| call(a, b, c, d, value, e) }
        when [6, 6] then Proc.new { |a, b, c, d, e| call(a, b, c, d, e, value) }

        when [7, 1] then Proc.new { |a, b, c, d, e, f| call(value, a, b, c, d, e, f) }
        when [7, 2] then Proc.new { |a, b, c, d, e, f| call(a, value, b, c, d, e, f) }
        when [7, 3] then Proc.new { |a, b, c, d, e, f| call(a, b, value, c, d, e, f) }
        when [7, 4] then Proc.new { |a, b, c, d, e, f| call(a, b, c, value, d, e, f) }
        when [7, 5] then Proc.new { |a, b, c, d, e, f| call(a, b, c, d, value, e, f) }
        when [7, 6] then Proc.new { |a, b, c, d, e, f| call(a, b, c, d, e, value, f) }
        when [7, 7] then Proc.new { |a, b, c, d, e, f| call(a, b, c, d, e, f, vlaue) }

        else raise NotImplementedError.new("only implemented for Proc with 7 argument or below")
        end
    end
end
