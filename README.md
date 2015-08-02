  # Lasean

Latent Semantic Analysis (LSA) for Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lasean'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lasean

## Usage

Lasean provides a very simple API:

```ruby
class LSA
  attr_accessor :u, :s, :v
  def initialize(matrix)
  def classify_row(values) { |index, row, similarity| … }
  def classify_column(values) { |index, column, similarity| … }
end
```

### Classify row:

```ruby
matrix = …
lsa = LSA.new(matrix)
lsa.classify_row(values) do |index, row, similarity|
  puts "Best match @ row #{index}: #{row} -> #{similarity}"
end
```

### Classify column:

```ruby
matrix = …
lsa = LSA.new(matrix)
lsa.classify_column(values) do |index, column, similarity|
  puts "Best match @ column #{index}: #{column} -> #{similarity}"
end
```

## Contributing

1. Fork it ([https://github.com/regexident/lasean/fork](https://github.com/regexident/lasean/fork))
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
