class Shoes
  include Types

  def self.app args={}, &blk
    app = App.new args

    app.instance_eval &blk

    repaint_all_by_order app
  
    # $0 is the name of the input file
    output = $0.gsub('.rb', '.html')
    open output, 'w' do |f|
      f.puts HEADER % [app.width, app.height], 
        FUNCTIONS, VARS, INTERVALS, FOOTER
    end
  end
end
