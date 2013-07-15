$: << "../lib"
require "proc_bind"

describe 'Proc with 1 argument' do
    let(:p1) { Proc.new { |a| a } }
    let(:p0) { p1.bind(1, "hello") }

    it "recevie no argument" do
        p0.parameters.should be_empty
    end

    it "pass correct parameter" do
        p0.call.should == "hello"
    end
end

describe 'Proc with 2 argument' do
    let(:p2) { Proc.new { |a, b| [a, b].join(" ") } }
    let(:p1) { p2.bind(2, "world") }

    it "recevie 1 argument" do
        p1.parameters.size.should == 1
    end

    it "pass correct parameter" do
        p1.call("hello").should == "hello world"
    end
end

describe 'Proc with 4 argument' do
    let(:p4) { Proc.new { |a, b, c, d| [a, b, c, d].join(" ") } }
    let(:p3) { p4.bind(4, "ruby") }
    let(:p2) { p3.bind(2, "world") }
    let(:p1) { p2.bind(2, "from") }
    let(:p0) { p1.bind(1, "hello") }

    it "recevie no argument" do
        p0.parameters.should be_empty
    end

    it "pass correct parameter" do
        p0.call.should == "hello world from ruby"
    end
end
