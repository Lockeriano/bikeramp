[![Build Status](https://travis-ci.com/Lockeriano/bikeramp.svg?token=ELUsktd7HPRkKSgQAEzD&branch=main)](https://travis-ci.com/github/Lockeriano/bikeramp)

# Environment credentials

We are using default credentials solution for rails 6. You will be granted with `master.key` as soon as you will become a developer of this project so you can encode and decode encrypted credentials with ease. Simply put your `master.key` in `config` directory and you are ready to go. To edit credentials run

```bash
# global credentials
rails credentials:edit

# or for specfic environment
rails credentials:edit --environment development  
```

# Tests

We are using [RSpec](https://github.com/rspec/rspec) to test our application. You will need your rsa private path set locally especially for test environment. Run code below to execute your specs.

```bash
bundle exec rspec spec
```
