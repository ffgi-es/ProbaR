# ProbaR

A simple copy/implementation of 
[RSpec](https://rspec.info)
with rather reduced functionality.

## Installation

### Requirements

requires rake

## Usage

In order to run the tests call:
```
$rake
```

As of writing it is possible to use
```
tests = ProbaR::describe "context" do
  it "should have a description" do
    expect(1).to eq 1
  end
  it "should have a failing description" do
    expect(1).to eq 2
  end
end

tests.run

tests.results[0] # => true
tests.results[1] # => false
```
which will return true or false accordling
and `it` blocks are currently halfway implemented but do not
work directly with `expect`.

