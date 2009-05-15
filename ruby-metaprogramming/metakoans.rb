#
# metakoans.rb is an arduous set of exercises designed to stretch
# meta-programming muscle.  the focus is on a single method 'attribute' which
# behaves much like the built-in 'attr', but whose properties require delving
# deep into the depths of meta-ruby.  usage of the 'attribute' method follows
# the general form of
#   
#   class C
#     attribute 'a'
#   end
#   
#   o = C::new
#   o.a = 42  # setter - sets @a
#   o.a       # getter - gets @a 
#   o.a?      # query - true if @a
#   
# but reaches much farther than the standard 'attr' method as you will see
# shortly.
#   
# your path, should you choose to follow it, is to write a single file
# 'knowledge.rb' implementing all functionality required by the koans below.
# as a student of meta-programming your course will be guided by a guru whose
# wisdom and pithy sayings will assist you on your journey.
#   
# a successful student will eventually be able to do this   
#   
#   harp:~ > ruby metakoans.rb knowledge.rb
#   koan_1 has expanded your awareness
#   koan_2 has expanded your awareness
#   koan_3 has expanded your awareness
#   koan_4 has expanded your awareness
#   koan_5 has expanded your awareness
#   koan_6 has expanded your awareness
#   koan_7 has expanded your awareness
#   koan_8 has expanded your awareness
#   koan_9 has expanded your awareness
#   mountains are again merely mountains
#   

module MetaKoans
  #
  # 'attribute' must provide getter, setter, and query to instances
  #
  def koan_1
    c = Class.new do
      attribute 'a'
    end

    o = c.new

    assert { not o.a? }
    assert { o.a = 42 }
    assert { o.a == 42 }
    assert { o.a? }
  end
  #
  # 'attribute' must provide getter, setter, and query to classes 
  #
  def koan_2
    c = Class.new do
      class << self
        attribute :a
      end
    end

    assert { not c.a? }
    assert { c.a = 42 }
    assert { c.a == 42 }
    assert { c.a? }
  end
  #
  # 'attribute' must provide getter, setter, and query to modules at module
  # level
  #
  def koan_3
    m = Module.new do
      class << self
        attribute :a
      end
    end

    assert { not m.a? }
    assert { m.a = 42 }
    assert { m.a == 42 }
    assert { m.a? }
  end
  #
  # 'attribute' must provide getter, setter, and query to modules which operate
  # correctly when they are included by or extend objects
  #
  def koan_4
    m = Module.new do
      attribute :a
    end
  
    c = Class.new do
      include m
      extend m
    end
  
    o = c.new
  
    assert { not o.a? }
    assert { o.a = 42 }
    assert { o.a == 42 }
    assert { o.a? }
  
    assert { not c.a? }
    assert { c.a = 42 }
    assert { c.a == 42 }
    assert { c.a? }
  end
  #
  # 'attribute' must provide getter, setter, and query to singleton objects 
  #
  def koan_5
    o = Object.new

    class << o
      attribute :a
    end

    assert { not o.a? }
    assert { o.a = 42 }
    assert { o.a == 42 }
    assert { o.a? }
  end
  #
  # 'attribute' must accept a default value as a parameter
  #
  def koan_6
    c = Class.new do
      attribute :a, 42
    end

    o = c.new

    assert { o.a == 42 }
    assert { o.a? }
    assert { (o.a = nil) == nil }
    assert { not o.a? }
  end
  #
  # 'attribute' must accept multiple attributes with default
  # values in a hash
  #
  def koan_7
    c = Class.new do
      attribute :a => 42, :b => 1701
    end
    
    o = c.new
    
    assert { o.a == 42 }
    assert { o.a? }
    assert { (o.a = nil) == nil }
    assert { not o.a? }
    assert { o.b == 1701 }
    assert { o.b? }
    assert { (o.b = nil) == nil }
    assert { not o.b? }
  end
  #
  # 'attribute' must provide a method for providing a default value as block
  # which is evaluated at instance level 
  #
  def koan_8
    c = Class.new do
      attribute(:a) { fortytwo }
      def fortytwo
        42
      end
    end
    
    o = c.new

    assert { o.a == 42 }
    assert { o.a? }
    assert { (o.a = nil) == nil }
    assert { not o.a? }
  end
  #
  # 'attribute' must provide inheritance of default values at both class and
  # instance levels
  #
  def koan_9
    b = Class.new do
      class << self
        attribute :a => 42
        attribute(:b) { a }
      end
      attribute :a => 42
      attribute(:b) { a }
    end

    c = Class.new(b)

    assert { c.a == 42 }
    assert { c.a? }
    assert { (c.a = nil) == nil }
    assert { not c.a? }

    o = c.new

    assert { o.a == 42 }
    assert { o.a? }
    assert { (o.a = nil) == nil }
    assert { not o.a? }
  end
  #
  # into the void 
  #
  def koan_a
    m = Module.new do
      attribute 'a' => 42
      attribute('b'){ a }
    end
    b = Class.new do
      class << self
        attribute 'a' => 42
        attribute('b'){ a }
      end
      include m
    end

    c = Class.new(b)

    assert{ c.a == 42 }
    assert{ c.a? }
    assert{ c.a = 'forty-two' }
    assert{ c.a == 'forty-two' }
    assert{ b.a == 42 }

    o = c.new

    assert{ o.a == 42 }
    assert{ o.a? }
    assert{ (o.a = nil) == nil }
    assert{ not o.a? }
  end

  def assert() 
    bool = yield
    abort "assert{ #{ caller.first[%r/^.*(?=:)/] } } #=> #{ bool.inspect }" unless bool 
  end
end


class MetaStudent
  def initialize knowledge
    require knowledge
  end
  def ponder koan
    begin
      send koan
      true
    rescue => e
      STDERR.puts "#{MetaGuru::RED}  #{ e.message } (#{ e.class })\n" + 
        "#{ e.backtrace.map{|l| "  " + l}.join 10.chr } #{MetaGuru::CLEAR}"
      false
    end
  end
end


class MetaGuru
  RED = "\033[1;31m"
  BLUE = "\033[1;34m"
  GREEN = "\033[1;32m"
  CLEAR = "\033[0m"
  require "singleton"
  include Singleton

  def moral(attainment)
    case attainment
    when nil 
      "mountains are merely mountains"
    when 'koan_1'
      "learn the rules so you know how to break them properly"
    when 'koan_2', 'koan_3'
      "remember that silence is sometimes the best answer"
    when 'koan_4', 'koan_5'
      "sleep is the best meditation"
    when 'koan_6', 'koan_7'
      "when you lose, don't lose the lesson"
    when 'koan_8', 'koan_9'
      "things are not what they appear to be: nor are they otherwise"
    else
      "mountains are again merely mountains"
    end
  end

  def enlighten student
    student.extend MetaKoans

    koans = student.methods.grep(%r/koan/).sort

    attainment = nil

    koans.each do |koan| 
      awakened = student.ponder koan
      if awakened
        puts "#{GREEN}#{ koan } has expanded your awareness#{CLEAR}"
        attainment = koan
      else
        puts
        puts "#{RED}#{ koan } still requires meditation#{CLEAR}"
        break
      end
    end

    puts(BLUE + moral(attainment) + CLEAR
    )
  end
  def self::method_missing m, *a, &b
    instance.send m, *a, &b
  end
end



knowledge = ARGV.shift or abort "#{ $0 } knowledge.rb"
student = MetaStudent::new knowledge 
MetaGuru.enlighten student
