defmodule Cards do
  def create_deck do
    values = ["ace", "two", "four", "three"]
    suits = ["spades", "clubs", "hearts", "diamond"]

    for suit <- suits , value <- values do
      "#{value} of #{suit}"
      end
    end


  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
end
