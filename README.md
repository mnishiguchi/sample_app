# Ruby on Rails Tutorial: sample application

This is the sample application for the
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

---

## Minitest memo

#### Running tests

```bash
$ bundle exec rake test             # Run all the tests.
$ bundle exec rake test:models      # Run only the model tests.
$ bundle exec rake test:integration # Run only the integration tests.
```

```bash
# Run a specific test within a test file
$ bundle exec rake test\           
  TEST=test/integration/users_login_test.rb\
  TESTOPTS="--name test_login_with_valid_information"
```

#### Generating a test

```bash
$ rails generate integration_test site_layout
```

- [Some uses of `assert_select`](https://www.railstutorial.org/book/filling_in_the_layout#table-assert_select)

---

## Database in Rails
http://edgeguides.rubyonrails.org/active_record_migrations.html#rolling-back

#### Database level validation
- [Active Record Migrations](http://edgeguides.rubyonrails.org/active_record_migrations.html)
- [Database level validation - Be The Better Rails Developer](http://blog.benroux.me/be-the-better-rails-developer)
  + Default and Not Null clauses
  + Column indexing
  + Unique column constraints
  + Foreign keys
  + Update statements
  + Multiple inserts/updates
- [Available field types](http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/TableDefinition.html#method-i-column)

#### [Rolling Back](http://edgeguides.rubyonrails.org/active_record_migrations.html#rolling-back)

```bash
rake db:rollback
```

- Executes the drop_table command to remove the users table from the database.
- Works only for [reversible migrations](http://edgeguides.rubyonrails.org/active_record_migrations.html#using-the-change-method) by default.
- In the case of an irreversible migration, such as one to remove a database column, it is necessary to define separate up and down methods in place of the single change method:
  + [Using reversible](http://edgeguides.rubyonrails.org/active_record_migrations.html#using-reversible)
  + [Using the up/down Methods](http://edgeguides.rubyonrails.org/active_record_migrations.html#using-the-up-down-methods)

---

## Regular expression
- [The valid email regex](https://www.railstutorial.org/book/modeling_users#table-valid_email_regex)
- [The Rubular regular expression editor](http://www.rubular.com/)

---

## Fixtures

- Default fixtures that were generated automatically by Rails sometimes cause a test to fail. Just delete them.

---

### The method for authenticating users
By comparing hashed values instead of raw passwords, we will be able to authenticate users without storing the passwords themselves. This means that, even if our database is compromised, our users’ passwords will still be secure.

1. Take a submitted password
2. Hash it
3. Compare the result to the hashed value stored in the database
4. If the two match, then the submitted password is correct and the user is authenticated.

https://www.railstutorial.org/book/modeling_users#sec-adding_a_secure_password

---

## Using ES6 modules in Rails

#### Install [browserify-rails](https://github.com/browserify-rails/browserify-rails)
```bash
gem "browserify-rails"
```

#### Install the following dependencies through npm

```bash
$ npm install --save babel-preset-es2015
$ npm install --save babelify
$ npm install --save browserify
$ npm install --save browserify-incremental
```

#### Add to Heroku buildpacks that run bundle and npm install
```bash
$ heroku buildpacks:add https://github.com/heroku/heroku-buildpack-nodejs.git
$ heroku buildpacks:add https://github.com/heroku/heroku-buildpack-ruby.git
```

#### [Add the following line to the `config/application.rb` file](https://github.com/browserify-rails/browserify-rails#using-browserify-transforms)

```bash
config.browserify_rails.commandline_options = "-t [ babelify --presets [ es2015 ] --extensions .es6 ]"
```

#### [Claer the asset pipeline cache](https://github.com/browserify-rails/browserify-rails#clear-the-asset-pipeline-cache)

```bash
$ rake tmp:cache:clear
```

#### Precompile assets before pushing it to heroku

```bash
bundle exec rake assets:precompile
```

---

## Troubleshooting

#### ActionController::RoutingError (No route matches [GET] "/logout")...
- Make sure that `jquery` and `jquery_ujs` are included in the `application.js`
 file.
- [The PATCH and DELETE verbs are less common than GET and POST and browsers are incapable of sending them natively. Rails makes it seem like browsers are issuing such requests, using JavaScript.](https://www.railstutorial.org/book/static_pages#aside-get_etc)

```js
//= require jquery
//= require jquery_ujs
```
