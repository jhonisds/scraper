# Coding Challenge: “A Dealer For the People”

[![Build Status](https://app.travis-ci.com/jhonisds/scraper.svg?branch=main)](https://app.travis-ci.com/jhonisds/scraper) [![codecov](https://codecov.io/gh/jhonisds/scraper/branch/master/graph/badge.svg?token=gt7Rp9SDxW)](https://codecov.io/gh/jhonisds/scraper)

The KGB has noticed a resurgence of overly excited reviews for a McKaig Chevrolet Buick, a dealership they have planted in the United States. In order to avoid attracting unwanted attention, you’ve been enlisted to scrape reviews for this dealership from [DealerRater.com ](https://www.dealerrater.com) and uncover the top three worst offenders of these overly positive endorsements.

## Features

- scrapes the first five pages [McKaig Chevrolet Buick - A Dealer For The People](https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685) of reviews.
- identifies the top three most “overly positive” endorsements.
- outputs these three reviews to the console, in order of severity.

## Review Score

Criteria used to define the main offenders, based on rating, content and keywords.

| Data             | Description                               |
| ---------------- | ----------------------------------------- |
| rating           | The highest rating                        |
| content          | Content length longer than 200 characters |
| Best service     | Keyword                                   |
| good experience  | Keyword                                   |
| highly recommend | Keyword                                   |
| amazing          | Keyword                                   |
| great person     | Keyword                                   |
| awesome          | Keyword                                   |

## Run

run the code:

```sh
git clone https://github.com/jhonisds/scraper.git
cd scraper
mix deps.get


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

## Code quality

To format and analyze the quality of the code, run:

```sh
mix quality
```

## Test Coverage

Analyze test coverage, run:

```sh
mix test --cover
```

Generate html file `cover/excoveralls.html`:

```sh
mix coveralls.html
```

## Documentation

To generate documentation of the modules and functions, open "html" docs at `doc/index.html`.

```sh
mix docs
```

## Test

To make sure all test is passing, run:

```sh
mix test
```

## References

- [Learn Functional Programming With Elixir](https://pragprog.com/titles/cdc-elixir/learn-functional-programming-with-elixir/)
- [Elixir in Action](https://www.manning.com/books/elixir-in-action-second-edition)
- [Programming Elixir 1.6](https://pragprog.com/titles/elixir16/programming-elixir-1-6/)
