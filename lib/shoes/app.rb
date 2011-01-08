class Shoes
  class App
    include Types

    def initialize args={}
      args[:width] ||= 600
      args[:height] ||= 500
      args[:interval] ||= 10
      @width, @height, @interval = args[:width], args[:height], args[:interval]
      @order = []
      @fill = @stroke = 'black'
    end
    
    attr_reader :width, :height, :interval
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
      args[:fill] ||= fill

      FUNCTIONS.push OVAL unless FUNCTIONS.include? OVAL
      args[:real] = %Q[    oval('%s', %s, %s, %s)]
      args[:app] = self
      Oval.new args
    end

    def rect *attrs
      args = attrs.last.class == Hash ? attrs.pop : {}
      case attrs.length
        when 0, 1
        when 2; args[:left], args[:top] = attrs
        when 3; args[:left], args[:top], args[:width] = attrs
        else args[:left], args[:top], args[:width], args[:height] = attrs
      end
      args = basic_attributes args
      args[:height] = args[:width] unless args[:height]
      args[:strokewidth] = ( args[:strokewidth] or strokewidth or 1 )
      args[:fill] ||= fill

      FUNCTIONS.push RECT unless FUNCTIONS.include? RECT
      args[:real] = %Q[    rect('%s', %s, %s, %s, %s)]
      args[:app] = self
      Rect.new args
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
    
    def js text, opt = :main
      Js.new self, opt, text
    end
  end
end
