# Parser

## Ruby Developer Test

Write a ruby script that:

a. Receives a log as argument (webserver.log is provided) e.g.: `./parser.rb webserver.log`

b. Returns the following:

* list of webpages with most page views ordered from most pages views to less page views e.g.:

```
/home 90 visits
/index 80 visits
etc...
```

* list of webpages with most unique page views also ordered, e.g.:

```
/about/2 8 unique views
/index 5 unique views
etc...
```

## How to run

* `asdf install`
* `bundle install`
* `./parser.rb webserver.log`
* `rspec`
* `rubocop`

## Notes

* I've assumed its ok to skip any invalid lines, rather than raise an error or exit
  * It could raise within the `Parser#parse`, and catch in the bin parser file
  * That way the caller could decide what to do with the error
* I've used a simple hash for data storage
  * this gives O(1) lookup time on adding new entries
  * and O(n^3) on displaying the results due to nested maps
  * all the data is in memory, so if the file is very large it could be a problem
  * for handling larger files, I would look at using a database
  * and then delegate the sorting to the database
* Git history is as I went, normally I would rebase and squash into succinct commits
* Not so keen on the type checking in `Parser#parse`, would look at example usage to determine best solution
* See also commits for more information
