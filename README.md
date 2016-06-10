# Ascent
Ascent is a highly customizable CMS created by and for developers.

## What is Ascent and why is it better then other CMS?
Ascent isn't made to be a plug and play CMS for Ruby on Rails. It is a basic wrapper to create a custom CMS for your needs! 
If you want to create a complete webpage in just a day Ascent may not suite your needs, 
but it may if you want to be able to completly customize all content on the website but don't want to create the hard parts it may just be perfect for you!.

Ascent uses a dynamic router, this allows us to specify specific nodes that should be rendered making it quick and resource light to load a page!

It's quick, it's dynamic and it's made for developers!


## Installation
```ruby
gem install ascent # Current version 0.0.0
```
Then run the installer, you will be prompted to select the namespace for the admin routes. (Defaults to '/admin' if none is entered)
```ruby
rails g ascent:install
```

##### NOTE!!! Closure_tree not updated!
As of now (2016-06-10) closure_tree can not create a root object. This is due to a change in Rails 5. 
It has been fixed but not released, therefore you need to create a "Ascent::Node" root node yourself.
This is done by setting the parent_id to null and in `node_heiracrhies` set ascentdent_id and descendant_id to the Node id
and generations to 0 yourself in your database.

### Development
After you downloaded the latest code from the master branch, create a new branch with your new feature or bugfix.
#### Running spec
Make sure you always run the spec before commiting and you have added text to your new code!

    rake # Runs spec and rubocop
    rake spec # Run only spec
#### Installing gem in development
To install the gem while developing run the following rake command (Sometimes you may need to uninstall the gem)

    rake install
    
    
## TODO
- Fill in this README more
- Check Issues for more info
