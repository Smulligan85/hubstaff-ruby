# Hubstaff Ruby Client

A Ruby toolkit for [Hubstaff](https://hubstaff.com/) API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hubstaff-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hubstaff-ruby

## Usage

Calls for Hubstuff API v1 are relative to the base url https://api.hubstaff.com/v1/

API actions are available as methods on the client object. Currently, the Hubstaff client has the following methods:

| Action               	                   | Method             					                           |
|:-----------------------------------------|:--------------------------------------------------------|
| **Users**                                |                   					                             |
| List users          	                   | `#users(org_member, project_member, offset)`            |
| Find a user          	                   | `#find_user(user_id)`                                   |
| Find a users organizations    	         | `#find_user_orgs(user_id, offset)`                      |
| Find a users projects                    | `#find_user_projects(user_id, offset)`                  |
| **Organizations**                        |                   					                             |
| List organizations                       | `#organizations(offset)`                                |
| Find a organization                      | `#find_organization(org_id)`                            |
| Find a organization projects 	           | `#find_org_projects(org_id, offset)`                    |
| Find a organization members              | `#find_org_members(org_id, offset)`                     |
| **Projects**                             |                   					                             |
| List projects                            | `#projects(active, offset)`                             |
| Find a project                           | `#find_project(project_id)`                             |
| Find a project members                   | `#find_project_members(project_id, offset)`             |
| **Activities**                           |                   					                             |
| List activities                          | `#activities(start_time, stop_time, options={})`        |
| **Notes**                                |                   					                             |
| List notes                               | `#notes(start_time, stop_time, options={})`             |
| Find a note                              | `#find_note(note_id)`                                   |
| **Weekly Reports**                       |                   					                             |
| List weekly team report                  | `#weekly_team(options={})`                              |
| List weekly individual report            | `#weekly_my(options={})`                                |
| **Custom Reports**                       |                   					                             |
| List custom team report by date          | `#custom_date_team(start_date, end_date, options={})`   |
| List custom individual report by date    | `#custom_date_my(start_date, end_date, options={})`     |
| List custom team report by member        | `#custom_member_team(start_date, end_date, options={})` |
| List custom individual report by member  | `#custom_member_my(start_date, end_date, options={})`   |
| List custom team report by project       | `#custom_project_team(start_date, end_date, options={})`|
| List custom individual report by project | `#custom_project_my(start_date, end_date, options={})`  |

## Usage Example

### Authentication

First, grab your personal ``APP_TOKEN`` found in [your account settings](https://developer.hubstaff.com/) and initialize a new client with your ``APP_TOKEN``.

After that, you'll authenticate the client and start exporting data from your account.

```ruby
require "hubstaff"

APP_TOKEN = "<hubstaff_app_token>"
APP_EMAIL = "<hubstaff_account_email>"
APP_PASSWORD = "<hubstaff_account_password>"

client = Hubstaff::Client.new(APP_TOKEN)

client.authenticate(APP_EMAIL,APP_PASSWORD)

client.auth_token
#=> "<hubstaff_auth_token>"
```

Here are some common use cases for the Hubstaff v1 API client.

### List users

You can list all users for a specific account, and get the details about their organization, and the projects they've worked on.

```ruby
puts "#{ JSON.pretty_generate(client.users(true,true)) }"

#=>
{
  "users": [
    {
      "id": 61188,
      "name": "Raymond Cudjoe",
      "last_activity": "2016-05-24T01:25:21Z",
      "email": "rkcudjoe@hookengine.com",
      "organizations": [
        {
          "id": 27572,
          "name": "Hook Engine",
          "last_activity": "2016-05-24T01:25:21Z"
        }
      ],
      "projects": [
        {
          "id": 112761,
          "name": "Build Ruby Gem",
          "last_activity": "2016-05-24T01:25:21Z",
          "status": "Active"
        },
        {
          "id": 120320,
          "name": "Hubstaff API tutorial",
          "last_activity": null,
          "status": "Active"
        }
      ]
    }
  ]
}
```

### Find a specific user

Users can be looked up by their ``user_id``.

```ruby
json_data = client.find_user(61188)
# => {"user": { "id":...}}

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, copy `.env.local.sample` to `.env.local` and substitute your own real values from your account. Finally, run `rake spec` to run the tests.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hookengine/hubstaff-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork it ( https://github.com/hookengine/hubstaff-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
