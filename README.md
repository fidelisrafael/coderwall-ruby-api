Coderwall Ruby API
==================

A simple Ruby API for access [Coderwall](http://coderwall.com) user's data.

Usage
=====
First, install the gem :
	
	gem install coderwall-ruby-api

Then, play :

	require 'coderwall'

	user = Coderwall::User.new('fidelisrafael') # Load user data
	user.username # => 'fidelisrafael'
	user.name     # => 'Rafael Fidelis'

When you create a Coderwall::User instance, automatically the data is fetched from Coderwall, so if you want to fetch user' data only when it requisited, do this:
	
	user = Corderwall::User.new('fidelisrafael',false) # create the object , but don't fetch the user data

	user.location  # => fetch the url and return user location
	user.name      # => use the cached user data requisited above

#### Differents ways to acess data :

	user = Coderwall::User.new('fidelisrafael') # Load user data

	user_badges = user.badges       # Method
	user_badges = user[:badges]     # Hash notation
	# Other examples
	user_github_account = user.accounts['github']
	user_github_account = user['accounts']['github']

	# via class methods
	user_badges = Coderwall::User.badges('fidelisrafael')
	user_location = Coderwall::User.location('fidelisrafael')
	# Another examples
	user_badges = Coderwall::User.achievements('fidelisrafael')
	user_github_account = Coderwall::User.accounts('fidelisrafael')['github']


Contributors
=========

* Kenichi Kamiya - https://github.com/kachick
* Syntactic Vexation - https://github.com/syntacticvexation

License
=======
The project is licensed under the MIT license. See LICENSE file for details. 	

Contribute
==========
Please feel free to either fork me or post issues.