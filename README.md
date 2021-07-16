# Furry Trails
[Demo](https://youtu.be/fnvZS7TgpLo)
This is a Dog Walking Program that allows users to add their dogs to their profiles and schedule walks for them.
Users can also comment on walkers that their dogs have walked with or will walk with in the future. 

## How To Use

To begin, fork and clone this repo. 
Install required gems and dependencies
```ruby
bundle install
bundle exec rake webpacker:install
``` 
In order to use the Google Oauth feature, you must obtain a Client ID and Client Secret from the Google Developers Website and include it in a high level .env file of this repository. Once you have this done, you can continue to run the migrations.
```ruby
rails db:migrate RAILS_ENV=development
rails db:seed
```

Once everything is installed and your migrations are complete, start the server using ```rails s```

Open the program by entering "localhost:3000" in your browser


## Contributions

Please submit a pull request for all contributions


## License

[MIT License](https://github.com/Janaeq/dogs/blob/master/LICENSE)
