# CreditCardProcessor

I made a command line gem so that my solution could easily be shared and accessed. My solution contains a modular architecture in which I used the SRP to break all components down into their smallest possible pieces. I then require those pieces when necessary. I tried not to be too fancy but write clean, simple, and reusable code that would serve as the foundation for later additions to the code base. In order to ensure quality my solution includes both unit tests and integration tests using Rspec. In terms of language, Ruby is the one I've been using most for the last couple of years so I decided to go with it on account of familiarity. 

## Installation

>Note that RubyGems and Bundler are required to use this gem 

Go to the root directory of the gem:

    $ cd credit_card_processor
    
And then execute:

    $ bundle

You will then need to build and install the gem:

    $ gem build credit_card_processor.gemspec
    $ gem install ./credit_card_processor-0.0.1.gem

## Usage -- Manually enter data

Once the gem is installed you can simply type:

    $ credit_card_processor
This will invoke an executable file which will start a command line session (there are instructions) where the user can enter commands:
    
    $ Add Tom 4111111111111111 $1000
    $ Charge Tom $500
    $ Credit Tom $25

When the user is done they type:
    
    $ done
    
And the program ends and they are given a printout of the transactions.

## Usage -- Pass a file to the command line

Once the gem is installed you can also pass a CSV file to the command line like so:

    $ process_credit_card_file test.csv
    
Which will print out a summary of the transactions

## Tests

To run the tests:

    $ rake spec
