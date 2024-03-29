defmodule Cards do

  @moduledoc """
  provides method for creating and handling a deck of cards
"""




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

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do

      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"

    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
