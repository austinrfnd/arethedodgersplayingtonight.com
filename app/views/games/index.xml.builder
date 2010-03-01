xml.instruct!

xml.days do
  0.upto(30) do |i|
    xml.day do
      xml.date i.days.ago.strftime("%m/%d/%y")
      xml.playing Game.game_at?(Time.now - i.days.ago) 
    end
  end
end