defmodule ScraperTest do
  use ExUnit.Case, async: true

  @attrs_review [
    %Scraper.Review{author: "Michael", rating: 1.0, content: "content", title: "title"},
    %Scraper.Review{author: "vnystel", rating: 5.0, content: "content", title: "title"},
    %Scraper.Review{author: "Jhoni", rating: 2.0, content: "content", title: "title"}
  ]

  setup do
    [
      review: Scraper.list_offenders(),
      review_1: Scraper.list_offenders(2, 1),
      review_2: Scraper.list_offenders(1, 2)
    ]
  end

  describe "list_offenders/2" do
    test "returns the top three worst offenders with default values", %{review: review} do
      expected = 3
      assert Enum.count(review) == expected
    end

    test "returns the top two worst offenders with one page", %{review_2: review} do
      expected = 2
      assert Enum.count(review) == expected
    end

    test "returns the top one worst offenders with two pages", %{review_1: review} do
      expected = 1
      assert Enum.count(review) == expected
    end
  end

  describe "sort/2" do
    test "order reviews by rating" do
      result = List.first(Scraper.sort(@attrs_review, 3))
      assert result.rating == 5.0
      assert result.author == "vnystel"
    end
  end
end
