defmodule Scraper do
  @moduledoc """
  Documentation for `Scraper`.
  """

  @base_url "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/"
  @filter "/?filter=ONLY_POSITIVE"
  @regex_rating ~r/rating-\d\d/

  @doc """
  Get rating.

  ## Examples

      iex> Scraper.get_rating()
      :world

  """

  def get_review(pages \\ 1, review \\ 3) do
    pages
    |> call()
    |> sort(review)
  end

  def create_review(document) do
    %{
      author: author(document),
      rating: rating(document),
      title: title(document),
      content: content(document)
    }
  end

  def author(document) do
    result =
      document
      |> Floki.find("span.italic.font-18.black.notranslate")
      |> Floki.text()
      |> String.split([" ", "-"], trim: true)

    case Enum.count(result) do
      1 ->
        List.first(result)

      _ ->
        Enum.reduce(result, fn x, acc -> acc <> " " <> x end)
    end
  end

  def title(document) do
    document
    |> Floki.find("h3.no-format.inline.italic-bolder.font-20.dark-grey")
    |> Floki.text()
    |> String.split("\"", trim: true)
    |> List.to_string()
  end

  def content(document) do
    document
    |> Floki.find("p.review-content")
    |> Floki.text(sep: "-")
    |> String.split("-")
    |> List.to_string()
  end

  def rating(document) do
    document
    |> Floki.find("div.rating-static.visible-xs")
    |> Floki.attribute("class")
    |> Enum.map(&get_rating/1)
    |> List.first()
  end

  def get_rating(element) do
    rating =
      @regex_rating
      |> Regex.run(element)
      |> Enum.map(&String.split(&1, "-"))
      |> List.flatten()
      |> Enum.at(1)
      |> String.to_integer()

    rating / 10
  end

  def sort(review, number) do
    review
    |> Enum.sort_by(&{&1.rating, String.length(&1.content)}, :desc)
    |> Enum.take(number)
  end

  def call(pages) do
    list = []

    Enum.map(1..pages, fn i ->
      url = "#{@base_url}page#{i}#{@filter}"

      case HTTPoison.get(url) do
        {:ok, %HTTPoison.Response{body: body}} ->
          {:ok, document} = Floki.parse_document(body)

          value =
            document
            |> Floki.find("div.review-entry")
            |> Enum.map(&create_review/1)

          list ++ value

        {:error, reason} ->
          reason
      end
    end)
    |> List.flatten()
  end
end
