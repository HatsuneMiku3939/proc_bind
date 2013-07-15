class Proc
  def bind(pos, value)
    @bound_args = Hash.new if @bound_args.nil?
    @bound_args[pos-1] = value
    self
  end

  alias_method :original_call, :call

  def call(*args)
    @bound_args.each_pair do |key, value|
      args[key] = value
    end if !!@bound_args
    args = args[0] if args.count == 1
    original_call(args)
  end

  def unbound_parameters
    return parameters if @bound_args.nil?
    params = parameters
    @bound_args.to_a.sort.reverse_each do |arg|
      params.delete_at arg.shift.to_i
    end
    params
  end
end
