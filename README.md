## Whodunit

This module allows you to store the user that created and last-updated a model.


## Usage


Call ```whodunit``` in your models:

```ruby
    class Model < ActiveRecord:Base
        whodunit
    end
```



## Design

In ApplicationController:
around_filter stores the current user in current thread for the duration of the action

In Model:
before_create calback sets 'created_by' column
before_save callback sets 'updated_by' column