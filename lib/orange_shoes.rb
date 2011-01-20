Types = module Shoes; self end

module Shoes
  HEADER =<<-EOS
<canvas id="orangeShoes" width="%d" height="%d" style="border:1px solid black;"></canvas>

<script type="text/javascript" language="JavaScript">

window.onload = function() {
  var canvas = document.getElementById('orangeShoes')
  var ctx = canvas.getContext("2d")
  var mouseX
  var mouseY
  canvas.onmousemove = getMousePoint
  function getMousePoint(evt){
    mouseX = evt.clientX - canvas.offsetLeft
    mouseY = evt.clientY - canvas.offsetTop
  }
  
  EOS

  FOOTER =<<-EOS
}
</script>
  EOS

  FUNCTIONS = []

  IMAGE =<<-EOS
  function image(source, x, y, w, h) {
    var img = new Image();
    img.onload = function() {
      ctx.drawImage(img,x,y,w,h); 
    } 
    img.src = source;
  }
  EOS

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
  
  VARS = []
  INTERVALS = []
  
  MAIN =<<-EOS

  setInterval(main, %d)
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
require_relative 'shoes/js'
require_relative 'shoes/main'
require_relative 'shoes/app'
require_relative 'shoes/colors'
