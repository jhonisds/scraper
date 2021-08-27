defmodule Scraper do
  @moduledoc """
  This module provides the `list_offenders` function to scrapes the first five pages of reviews.
  """

  alias Scraper.{Html, Output}

  @doc """
  List top three worst offenders.

  ## Examples

      iex> Scraper.list_offenders()
      Top three worst offenders for a McKaig Chevrolet Buick

      3 - [5.0]  I highly recommend McKaig in Gladwater !! Raymond Prazak... -- by Crystal Johnson

      I highly recommend McKaig in Gladwater...

  """
  def list_offenders(pages \\ 5, review \\ 3) do
    pages
    |> Html.call()
    |> sort(review)
    |> Output.display()
  end

  @doc """
  Order top three worst offenders.

  ## Examples
      review = [%Scraper.Review{..}]
      iex> Scraper.sort(review, 3)
      [%Scraper.Review{author: ...}]
  """
  def sort(review, number) do
    review
    |> Enum.sort_by(&{&1.rating, String.length(&1.content)}, :desc)
    |> Enum.take(number)
  end
end
