defmodule HtmlTest do
  use ExUnit.Case, async: true

  alias Scraper.Html

  @fixture_page "test/fixtures/page1.html.eex"

  setup do
    [
      document: Html.call(1),
      document_2: Html.call(2),
      document_3: Html.call(3),
      document_4: Html.call(4),
      document_5: Html.call(5),
      page: @fixture_page
    ]
  end

  describe "call/1" do
    test "returns the number of review for one pages", %{document: document} do
      assert Enum.count(document) == 10
    end

    test "returns the number of review for two pages", %{document_2: document} do
      assert Enum.count(document) == 20
    end

    test "returns the number of review for three pages", %{document_3: document} do
      assert Enum.count(document) == 30
    end

    test "returns the number of review for four pages", %{document_4: document} do
      assert Enum.count(document) == 40
    end

    test "returns the number of review for default", %{document_5: document} do
      assert Enum.count(document) == 50
    end
  end
end
