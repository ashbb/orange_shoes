require '../lib/orange_shoes'

Shoes.app width: 400, height: 400, interval: 20 do
  js text =<<-EOS, :vars
  vx = 3
  vy = 4
  nx = 0
  ny = 0
  ball_left = 0
  ball_top = 0
  comp_left = 0
  you_left = 0
  EOS

  js test =<<-EOS
    if (ball_top + 10 < 0 || ball_top > 400) {
      msg = ball_top > 400 ? 'Computer WIN!' : '      You WIN!'
      ctx.font = "40pt Calibri"
      ctx.fillText(msg, 30, 200)
    } else {
      nx = ball_left + vx
      ny = ball_top + vy

      if (nx + 10 > 400 || nx < 0) { vx = -vx }

      if (ny + 10 > 400 && nx + 10 > you_left && nx < you_left + 75) {
        vy = -vy * 1.2
        vx = (nx - you_left - 37.5) * 0.25
      }
      
      if (ny < 0 && nx + 10 > comp_left && nx < comp_left + 75) {
        vy = -vy * 1.2
        vx = (nx - comp_left - 37.5) * 0.25
      }
      if (comp_left + 75 < ball_left) { comp_left += 10 }
      if (ball_left + 10 < comp_left) { comp_left -= 10 }

      ball_left = nx
      ball_top = ny
      oval('forestgreen', ball_left, ball_top, 10)
      rect('black', comp_left, 0, 75, 4)
      you_left = mouseX - 37.5
      rect('black', you_left, 396, 75, 4)
    }
  EOS

end
