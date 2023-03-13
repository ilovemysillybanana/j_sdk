### API Structure

The way this works is there's a class to represent each object of the LOTR API.

`Quote`, `Movie`, are the only ones implemented but we can add additional ones such as `Character` rather easily.

First we instantiate the `LOTR` class by passing in a token. This will return a client object. The client object will be passed with subsequent objects creating calls so that those objects have ways to use the client.

For instance any `Movie` should be able to call `#get_quotes()` on itself.

### Testing

Testing is done using a tool called VCR which allows connections to happen on initial test run - however it intercepts on next test runs.

```
bundle exec rspec spec/
```

Will run the test suite against our saved test data in `fixtures/cassettes`, if you'd like to recreate those and test again the live api, you can either rename or delete them and rerun the test suite.