# Coding Challenge: “A Dealer For the People”

The KGB has noticed a resurgence of overly excited reviews for a McKaig Chevrolet Buick, a dealership they have planted in the United States. In order to avoid attracting unwanted attention, you’ve been enlisted to scrape reviews for this dealership from [DealerRater.com ](https://www.dealerrater.com) and uncover the top three worst offenders of these overly positive endorsements.

## Features

- scrapes the first five pages [McKaig Chevrolet Buick - A Dealer For The People](https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685) of reviews.
- identifies the top three most “overly positive” endorsements.
- outputs these three reviews to the console, in order of severity.

## Criteria

## Run

run the code:

```sh
git clone https://github.com/jhonisds/scraper.git
cd scraper
iex -S mix

iex(1)> Scraper.list_offenders

```

## Review fields

| Attribute | Description            |
| --------- | ---------------------- |
| `author`  | The name of the author |
| `rating`  | The rating             |
| `title`   | The review title       |
| `content` | The content            |

## Test

To make sure all test is passing, run:

```sh
mix test
```

## References

- [Learn Functional Programming With Elixir](https://pragprog.com/titles/cdc-elixir/learn-functional-programming-with-elixir/)
- [Elixir in Action](https://www.manning.com/books/elixir-in-action-second-edition)
- [Programming Elixir 1.6](https://pragprog.com/titles/elixir16/programming-elixir-1-6/)
