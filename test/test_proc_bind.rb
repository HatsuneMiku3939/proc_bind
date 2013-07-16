require "test/unit"
require "proc_bind"

class ProcBindTest <  Test::Unit::TestCase
  def test_proc_with_1_arg
    p1 =  Proc.new { |a| [a] }
    p0 = p1.bind(1, "hello")

    assert_equal p0.call, %w"hello"
  end

  def test_proc_with_2_arg
    p2 = Proc.new { |a, b| [a, b] }
    p1 = p2.bind(2, "world")

    assert_equal p1.call("hello"), %w"hello world"
  end

  def test_proc_with_default_value
    p2 = Proc.new { |a, b="world"| [a, b] }
    p1 = p2.bind(1, "hello")

    assert_equal p2.call("hello"), %w"hello world"
    assert_equal p1.call(), %w"hello world"
  end

  def test_proc_with_asterisk
    p4 = Proc.new { |a, *b| [a, b] }
    p3 = p4.bind(1, "hello")
    p2 = p3.bind(1, "hello", "world", "yahoo")

    assert_equal p2.call(), p4.call("hello", "hello", "world", "yahoo")
  end

  def test_proc_with_4_arg
    p4 = Proc.new { |a, b, c, d| [a, b, c, d] }
    p3 = p4.bind(4, "ruby")
    p2 = p3.bind(3, "from")
    p1 = p2.bind(2, "world")
    p0 = p1.bind(1, "hello")

    assert_equal p0.call, %w"hello world from ruby"
  end
end
