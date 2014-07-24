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

  # loop through number array to check if royal or straight
  # also create count array that counts number of cards with each card number
  is_royal = false
  is_straight = false
  index = hand_numbers[0]
  count_array = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  hand_numbers.each do |number|
    count_array[number] += 1
    if number == index
      index += 1
    end
  end

  if index == (hand_numbers[0] + 5)
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
    # loop through count array to check for 4 of a kind, full house, 3 of a kind, 2 pair or pair
    number_pairs = 0
    count_array.each do |count|
      puts "count in first each loop = " + count.to_s
      if count == 2
        number_pairs += 1
      end
    end
    index = 0
    count_array.each do |count|
      puts "count in second each loop = " + count.to_s
      if count == 4
        return "four of a kind"
      elsif count == 3
        if number_pairs == 1
          return "full house"
        else
          return "three of a kind"
        end
      elsif index == 14
        if number_pairs == 2
          return "two pairs"
        elsif number_pairs == 1
          return "pair"
        else index == 14
          return "nothing"
        end
      else
        index += 1
      end
    end
  end

end

# poker_hand(['3C', '2S','2D', '2C', '2H'])
# poker_hand(['3C', '3S','4D', '4C', '4H'])
# poker_hand(['3C', '6S','4D', '4C', '4H'])
# poker_hand(['3C', "2S",'4D', '5C', '7H'])
