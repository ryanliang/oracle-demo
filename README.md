A quick demo for using selenium-webdriver
=========================================

This demo contains two exercies:
  - Google, which performs a google search, selects the auto complete and clicks on the result link.
  - Modal, which opens two modal windows and closes them all after.
  
It is built with the following gems:
  - [selenium-webdriver in Ruby binding](https://code.google.com/p/selenium/wiki/RubyBindings)
  - [page-object](https://github.com/cheezy/page-object)
  - [RSpec](http://rspec.info/)

## To run the demo
#### Before running:
Please ensure you have the following dependencies:
  - [Ruby](http://www.ruby-lang.org/en/) version 1.9.2p180 or newer
  - [bundler](http://bundler.io/) version 1.0.21
  - In the project root directory "oracle-demo", run this command at command prompt
    ```bundle install```

#### Running the demo:
There are two specs one for the Google exercise and one for the Modal exercis.

 - To run both spec:
  ```bundle exec rake spec```
    
 - To run only the Google spec:
  ```bundle exec rake spec SPEC=specs/google_spec.rb```
 - To run only the Modal spec:
  ```bundle exec rake spec SPEC=specs/modal_spec.rb```
