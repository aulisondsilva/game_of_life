module LifeHelper
  def box_size
    row = (((@rows + @cols) / 2).to_i + 5)
    box_size = case
               when row < 10    #compare to 1
                 40
               when row >= 10 && row < 20
                 35
               when row >= 20 && row < 30
                 30
               when row >= 30 && row < 40
                 25
               when row >= 40 && row < 50
                 20
               when row >= 50
                 15
               else
                 0
               end
    box_size
  end
end
