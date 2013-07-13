$: << "../lib"
require "proc_bind"

ori = Proc.new { |a, b, c, d|
    puts [a, b, c, d].join(" ")
}

p3 = ori.bind(4, "ruby")
p2 = p3.bind(2, "world")
p1 = p2.bind(2, "from")
p0 = p1.bind(1, "hello")

ori.call "hello", "world", "from", "ruby"
p0.call
p1.call "HELLO"
