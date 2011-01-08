class Shoes
  class Js
    include Types

    def initialize app, opt, text
      FUNCTIONS.push OVAL unless FUNCTIONS.include? OVAL
      FUNCTIONS.push RECT unless FUNCTIONS.include? RECT

      case opt
        when :main
          app.order << self
          @real = '    ' + text
        when :vars
          VARS.push text
        else
      end
    end
    attr_accessor :real
  end
end
