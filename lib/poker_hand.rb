def poker_hand (your_hand)

  # turn input array of strings into 2 arrays, one of suit strings and one of card number arrays
  # converts face cards to numbers

  hand_numbers = []
  hand_suits = []

  your_hand.each do |card|
    hand_suits.push(card[card.length-1])
    card_string = card[0..(card.length-2)]
    if card_string == "J"
      card_string = "11"
    elsif card_string == "Q"
      card_string = "12"
    elsif card_string == "K"
      card_string = "13"
    elsif card_string == "A"
      card_string = "14"
    end
    card_string_int = card_string.to_i
    hand_numbers.push(card_string_int)
  end

  # sort arrays

  hand_suits.sort!
  hand_numbers.sort!

  # loop through suit arrays to determine if we have a flush; state saved in is_flush
  is_flush = false
  save_suit = hand_suits[0];
  hand_suits.each do |suit|
    if suit == save_suit
      is_flush = true
      save_suit = suit
    else
      is_flush = false
    end
  end

  # loop through number array to check if royal
  is_royal = false
  is_straight = false
  index = hand_numbers[0]
  hand_numbers.each do |number|
    if number == index
      index+=1
    end
  end

  if index == hand_numbers[0] + 5
    is_straight = true
    if index == 15
      is_royal = true
    end
  end

  if is_royal && is_flush
    return "royal flush"
  elsif is_straight && is_flush
    return "straight flush"
  elsif is_flush
    return "flush"
  elsif is_straight
    return "straight"
  else
    return "nothing"
  end

  # hand_numbers.sort.each do |number|
  #   if
  # puts "numbers = " + hand_numbers.sort.to_s
  # puts "suits = " + hand_suits.sort.to_s
end

# poker_hand(['9C', '10C', 'JC', 'QC', 'KC'])
