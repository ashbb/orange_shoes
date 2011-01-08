class Shoes
  class App
    def basic_attributes args={}
      default = {left: 0, top: 0, width: 0, height: 0, angle: 0, curve: 0}
      default.merge args
    end
  end

  def self.repaint_all_by_order app
    INTERVALS.push(MAIN % app.interval)
    app.order.each do |e|
      INTERVALS.push(e.is_a?(Js) ? e.real : (e.real % [e.fill, e.left, e.top, e.width, e.height]))
    end
    INTERVALS.push "  }"
  end
end
