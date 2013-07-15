require "test/unit"
require "proc_bind"

class ProcBindTest <  Test::Unit::TestCase
  def test_proc_with_1_arg
    p1 =  Proc.new { |a| a }
    p0 = p1.bind(1, "hello")

    assert_equal p0.parameters.size, 0
    assert_equal p0.call, "hello"
  end

  def test_proc_with_2_arg
    p2 = Proc.new { |a, b| [a, b].join(" ") }
    p1 = p2.bind(2, "world")

    assert_equal p1.parameters.size, 1
    assert_equal p1.call("hello"), "hello world"
  end

  def test_proc_with_4_arg
    p4 = Proc.new { |a, b, c, d| [a, b, c, d].join(" ") }
    p3 = p4.bind(4, "ruby")
    p2 = p3.bind(2, "world")
    p1 = p2.bind(2, "from")
    p0 = p1.bind(1, "hello")

    assert_equal p0.parameters.size, 0
    assert_equal p0.call,"hello world from ruby"
  end
end
