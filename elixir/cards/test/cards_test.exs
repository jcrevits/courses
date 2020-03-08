defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create decks makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 36
  end

  test "shuffling a deck randomizes it" do
    cards = Cards.create_deck
    refute cards == Cards.shuffle(cards)
  end

end
