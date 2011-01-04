class Shoes
  class App
    include Types

    def initialize args={}
      @order = []
    end
    
    attr_accessor :order

    def oval *attrs
      args = attrs.last.class == Hash ? attrs.pop : {}
      case attrs.length
        when 0, 1
        when 2; args[:left], args[:top] = attrs
        when 3; args[:left], args[:top], args[:radius] = attrs
        else args[:left], args[:top], args[:width], args[:height] = attrs
      end
      args = basic_attributes args
      args[:width].zero? ? (args[:width] = args[:radius] * 2) : (args[:radius] = args[:width]/2.0)
      args[:height] = args[:width] if args[:height].zero?
      args[:strokewidth] = ( args[:strokewidth] or strokewidth or 1 )

      FUNCTIONS.push OVAL unless FUNCTIONS.include? OVAL
      args[:real] = %Q[    oval("black", %s, %s, %s)]
      args[:app] = self
      Oval.new args
    end

    %w[fill stroke strokewidth].each do |name|
      eval "def #{name} #{name}=nil; #{name} ? @#{name}=#{name} : @#{name} end"
    end
    
    def animate n=10, &blk
      n = 1000 / n
      INTERVALS.push(ANIMATE % n)
      instance_eval &blk
      INTERVALS.push "  }\n\n"
    end
  end
end
