defmodule ScraperTest do
  use ExUnit.Case, async: true

  @attrs_review [
    %Scraper.Review{
      author: "vnystel",
      content:
        "Best service department in east Texas. Patrick and the service department handle my appointment on time, with great courtesy and professionalism. Patrick remains one of the friendliest and professional service writers I've ever worked with.",
      rating: 5.0,
      title: "Best service department in east Texas. Patrick and the..."
    },
    %Scraper.Review{
      author: "saze_75672",
      content:
        "Kristina and Big K were exceptional in the buying process. She even checked on me after I took the vehicle home! Thanks for your help!",
      rating: 5.0,
      title: "Kristina and Big K were exceptional in the buying..."
    },
    %Scraper.Review{
      author: "jolie.basham",
      content:
        "These guys! 100 % on top of it. I had a budget, a tradin, and a goal and they worked with me and stuck through it all! Ray, Freddie, Brandon, went through everything clearly, honestly, and didn't brush anything we said under the rug, or try to push us in a direction we didn't want to go. These guys go above and beyond, including saving an old USMC bear I left in my trade and making sure it was there to be picked up. They remembered our names, they made us feel like we were just sitting around having dinner...they take TIME with their customers and get to know you. We shared family stories and you just get an experience where you don't have to try and look at the salesman and sift through all the stuff you normally would expect from a salesman, because they don't do that. They listen and they respect the truth! Also, from my perspective, they didn't just talk to my husband, they spoke to me! THAT is 100% bonus in my book. And my new to me car, is in my budget WITH an extended warranty. This place.....salt of earth car sales which is a rare find!",
      rating: 5.0,
      title: "These guys! 100 % on top of it. I had a budget, a..."
    }
  ]

  setup do
    [
      review: Scraper.list_offenders(),
      review_1: Scraper.list_offenders(2, 1),
      review_2: Scraper.list_offenders(1, 2),
      data: @attrs_review
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
    test "order reviews by rating", %{data: data} do
      result = List.first(Scraper.sort(data, 1))
      assert result.rating == 5.0
      assert result.author == "vnystel"
    end
  end
end
