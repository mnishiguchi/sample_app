# Ruby on Rails Tutorial: sample application

This is the sample application for the
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

---

## Memo

### Integration test

#### Create

```bash
$ rails generate integration_test site_layout
```

#### Edit the test file
- [Some uses of `assert_select`](https://www.railstutorial.org/book/filling_in_the_layout#table-assert_select)

#### Run

```bash
$ bundle exec rake test:integration
```
