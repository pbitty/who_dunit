# NOTE: THIS IS ALPHA CODE

## who_dunit

This module allows you to store the user that created and last-updated a model.


## Usage

### In your model
```ruby
    class Model < ActiveRecord:Base
        who_dunit #Enable saving of created_by and updated_by
    end
```

### In your base controller class (usually ApplicationController)

``` ruby
	class ApplicationController < ActiveController:Base
		who_dunit #Enable tracking of current user
	end
```

### Migrations
``` ruby
## TODO Write migration example
``` 


## Design

In ApplicationController:
around_filter stores the current user in current thread for the duration of the action

In Model:
before_create calback sets 'created_by' column
before_save callback sets 'updated_by' column

In Migrations:
