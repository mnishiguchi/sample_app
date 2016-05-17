# Ruby on Rails Tutorial: sample application

This is the sample application for the
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

---

## Memo


### Model test

#### Run

```bash
$ bundle exec rake test             # Run all the tests.
$ bundle exec rake test:models      # Run only the model tests.
$ bundle exec rake test:integration # Run only the integration tests.
```

### Integration test

```bash
$ rails generate integration_test site_layout
```

- [Some uses of `assert_select`](https://www.railstutorial.org/book/filling_in_the_layout#table-assert_select)

---

### [rails generate](http://guides.rubyonrails.org/command_line.html#rails-generate)

```bash
# List all the available generators
$ rails generate
```

#### The controller generator
- Usage: `rails generate controller NAME [action action] [options]`
- Example: `rails generate controller Users new`
- Help: `rails generate controller`

#### The model generator
- Usage: `rails generate model NAME [field[:type][:index] field[:type][:index]] [options]`
- Example: `rails generate model User name:string email:string`
- Help: `rails generate model`

#### The resource generator
- Stubs out a new resource including:
  + an empty model
  + controller suitable for a restful, resource-oriented application
- Usage: `rails generate resource NAME [field[:type][:index] field[:type][:index]] [options]`
- Example: `rails generate resource post title:string body:text published:boolean``
- Help: `rails generate resource`

#### The scaffold generator
- Generates a full set of:
  + model
  + database migration for that model
  + controller to manipulate it
  + views to view and manipulate the data
  + a test suite for each of the above
- Usage: `rails generate scaffold NAME [field[:type][:index] field[:type][:index]] [options]`
- Example: `rails generate scaffold post title body:text published:boolean`
- Help: `rails generate scaffold`

#### [RAILS: GENERATE MODEL VS. RESOURCE VS. SCAFFOLD](http://www.korenlc.com/rails-generate-model-vs-resourse-vs-scaffold/)

---

### Database in Rails
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

### Regular expression
- [The valid email regex](https://www.railstutorial.org/book/modeling_users#table-valid_email_regex)
- [The Rubular regular expression editor](http://www.rubular.com/)
