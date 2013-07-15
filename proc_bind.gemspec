require "rubygems"

spec = Gem::Specification.new do |s|
  s.name = "proc_bind"
  s.version = "0.9.0"
  s.homepage = "https://github.com/filepang/proc_bind"

  s.files = Dir.glob("lib/proc_bind.rb")
  s.test_files = Dir.glob("test/bind.rb")

  s.author = "Kim SeungSu"
  s.email = "filepang@lycos.co.kr"

  s.has_rdoc = false
  s.required_ruby_version = ">= 1.9.3"

  s.summary = "Ruby/Proc extention"
  s.description = "add a argument binding feature for Class: Proc"
end
