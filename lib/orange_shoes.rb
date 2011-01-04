Types = module Shoes; self end

module Shoes
  HEADER =<<-EOS
<canvas id="orangeShoes" width="600" height="500" style="border:1px solid black;"></canvas>

<script type="text/javascript" language="JavaScript">

window.onload = function() {
  var canvas = document.getElementById('orangeShoes')
  var ctx = canvas.getContext("2d")

  EOS

  FOOTER =<<-EOS
}
</script>
  EOS

  FUNCTIONS = []

  OVAL =<<-EOS
  function oval(c, x, y, r){
    ctx.beginPath()
    ctx.fillStyle = c
    ctx.arc(x+r, y+r, r, 0, Math.PI*2, true)
    ctx.closePath()
    ctx.fill()
  }

  EOS
  
    RECT =<<-EOS
  function rect(c, x, y, w, h){
    ctx.beginPath()
    ctx.fillStyle = c
    ctx.fillRect(x, y, w, h)
    ctx.closePath()
    ctx.fill()
  }

  EOS
  
  INTERVALS = []
  
  MAIN =<<-EOS
  setInterval(main, 10)
  function main(){
    ctx.clearRect(0, 0, canvas.width,canvas.height)
  EOS
  
  ANIMATE =<<-EOS
  setInterval(animate, %d)
  i = 0
  function animate(){
    i += 1
  EOS
end

class Object
  remove_const :Shoes
end

require_relative 'shoes/helper_methods'
require_relative 'shoes/basic'
require_relative 'shoes/main'
require_relative 'shoes/app'