require '../lib/orange_shoes'

Shoes.app do
  o1 = oval 0, 0, 10
  o2 = oval 0, 300, 10, 10
  animate 36 do |i|
    o1.move 'i', 'i*2'
    o2.move 'i*3', '300-i*2'
  end
end
