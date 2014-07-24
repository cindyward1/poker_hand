require("rspec")
require("poker_hand")

describe("poker_hand") do
  it("returns royal flush if given a royal flush hand") do
    poker_hand(['10C', 'JC', 'QC', 'KC', 'AC']).should(eq("royal flush"))
  end

  it("returns straight flush if given a straight flush hand") do
    poker_hand(['9C', '10C', 'JC', 'QC', 'KC']).should(eq("straight flush"))
  end

  it("returns flush if given a flush hand") do
    poker_hand(['5H', '10H', '3H', '6H', 'AH']).should(eq("flush"))
  end

  it("returns straight if given a straight hand") do
    poker_hand(['3C', "2S",'4D', '5C', '6H']).should(eq("straight"))
  end

  it("returns nothing if given no special hand") do
    poker_hand(['3C', "2S",'4D', '5C', '7H']).should(eq("nothing"))
  end
end
