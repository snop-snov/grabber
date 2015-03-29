## README
Grabber is a simple script that grab all images from remote page.

### Requirements
* Ruby  2.2.0

### Dependencies
Grabber uses this gems:
* [gem 'nokogiri'](https://github.com/sparklemotion/nokogiri)
* [gem 'celluloid'](https://github.com/celluloid/celluloid)

### Tests
##### Dependencies
* [gem 'rspec'](https://github.com/rspec/rspec)
* [gem 'webmock'](https://github.com/bblimke/webmock)
* [gem 'vcr'](https://github.com/vcr/vcr)

##### How to run the test suite
```sh
$ rspec
```
### Usage
```sh
$ ./grab.rb 'www.google.com' /tmp
```
