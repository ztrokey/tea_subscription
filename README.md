![image](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![image](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![image](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![RuboCop](https://img.shields.io/badge/code%20style-Rubocop-red?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzMiAzMiI+PHRpdGxlPmZpbGVfdHlwZV9ydWJvY29wPC90aXRsZT48cGF0aCBkPSJNMjcuMDUsMTMuOVYxM2ExLjc5MywxLjc5MywwLDAsMC0xLjgtMS44SDYuNjVBMS43OTMsMS43OTMsMCwwLDAsNC44NSwxM3YuOWExLjUyNSwxLjUyNSwwLDAsMC0uNywxLjJ2Mi40YTEuMzg3LDEuMzg3LDAsMCwwLC43LDEuMnYuOWExLjc5MywxLjc5MywwLDAsMCwxLjgsMS44aDE4LjdhMS43OTMsMS43OTMsMCwwLDAsMS44LTEuOHYtLjlhMS41MjUsMS41MjUsMCwwLDAsLjctMS4yVjE1LjFBMS43NDIsMS43NDIsMCwwLDAsMjcuMDUsMTMuOVoiIHN0eWxlPSJmaWxsOiNjNWM1YzUiLz48cGF0aCBkPSJNMTUuOTUsMmE5LjkyNSw5LjkyNSwwLDAsMC05LjgsOC42aDE5LjZBOS45MjUsOS45MjUsMCwwLDAsMTUuOTUsMloiIHN0eWxlPSJmaWxsOiNjNWM1YzUiLz48cG9seWdvbiBwb2ludHM9IjEzLjA1IDI0IDE4Ljg1IDI0IDE5LjQ1IDI0LjcgMjAuMzUgMjQgMTkuNDUgMjIuOSAxMi40NSAyMi45IDExLjU1IDI0IDEyLjQ1IDI0LjcgMTMuMDUgMjQiIHN0eWxlPSJmaWxsOiNjNWM1YzUiLz48cGF0aCBkPSJNMjMuNTUsMTcuNkg4LjM1YTEuMywxLjMsMCwxLDEsMC0yLjZoMTUuM2ExLjMyNCwxLjMyNCwwLDAsMSwxLjMsMS4zQTEuNDkzLDEuNDkzLDAsMCwxLDIzLjU1LDE3LjZaIiBzdHlsZT0iZmlsbDojZWMxYzI0Ii8+PHBhdGggZD0iTTIzLjA1LDIydjMuOGExLjk2NywxLjk2NywwLDAsMS0xLjksMS45aC0xYS44NjQuODY0LDAsMCwxLS42LS4zbC0xLjItMS42YS42LjYsMCwwLDAtLjYtLjNoLTMuNmEuNzY0Ljc2NCwwLDAsMC0uNS4ybC0xLjMsMS42YS42LjYsMCwwLDEtLjYuM2gtMWExLjk2NywxLjk2NywwLDAsMS0xLjktMS45VjIySDYuNTV2My44YTQuMjI1LDQuMjI1LDAsMCwwLDQuMiw0LjJoMTAuNGE0LjIyNSw0LjIyNSwwLDAsMCw0LjItNC4yVjIyWiIgc3R5bGU9ImZpbGw6I2M1YzVjNSIvPjwvc3ZnPg==)


# Tea Subscription
An API that allows users to subscribe, cancel and view all of their tea subscriptions.

### Getting Started

These instructions will give you a copy of the project up and running on
your local machine for development and testing purposes.

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`
5. Seed the database: `rails db:seed`

## Versions
* Ruby 2.7.2
* Rails 6.1.4

## Important Gems
Testing
* [rspec-rails](https://github.com/rspec/rspec-rails)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [simplecov](https://github.com/simplecov-ruby/simplecov)
* [pry](https://github.com/pry/pry)
* [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)

## Running the tests

Run `bundle exec rspec` to run the test suite

## Schema

![Screen Shot 2021-09-22 at 11 28 16 AM](https://user-images.githubusercontent.com/20480167/134392548-4e240d23-7db2-4772-b08d-d168cb9b5398.png)

## Endpoints Exposed

`GET /api/v1/customers/<customer_id>/subscriptions`

Returns all of a customer’s subsciptions (active and canceled)

```
{
    "data": [
        {
            "id": "307",
            "type": "subscription",
            "attributes": {
                "price": 7.29,
                "status": "active",
                "frequency": "monthly",
                "tea": {
                    "id": 77,
                    "name": "Lapsang Souchong",
                    "description": "English Afternoon",
                    "temperature": 187,
                    "brew_time": 4,
                    "created_at": "2021-09-22T15:48:12.197Z",
                    "updated_at": "2021-09-22T15:48:12.197Z"
                }
            }
        },
        {
            "id": "308",
            "type": "subscription",
            "attributes": {
                "price": 5.97,
                "status": "canceled",
                "frequency": "weekly",
                "tea": {
                    "id": 73,
                    "name": "Shou Mei",
                    "description": "Fujian New Craft",
                    "temperature": 203,
                    "brew_time": 5,
                    "created_at": "2021-09-22T15:48:12.187Z",
                    "updated_at": "2021-09-22T15:48:12.187Z"
                }
            }
        },
    ]
}
```

`POST /api/v1/customers/<customer_id>/subscriptions?title='New Tea Subscription'&price=12.34&tea_id=80`

Subscribes a customer to a new tea subscription

```
{
    "data": {
        "id": "321",
        "type": "subscription",
        "attributes": {
            "price": 12.34,
            "status": "pending",
            "frequency": "monthly",
            "tea": {
                "id": 80,
                "name": "Vietnamese",
                "description": "Irish Breakfast",
                "temperature": 187,
                "brew_time": 5,
                "created_at": "2021-09-22T15:48:12.204Z",
                "updated_at": "2021-09-22T15:48:12.204Z"
            }
        }
    }
}
```

`PATCH /api/v1/customers/<customer_id>/subscriptions/<subscription_id>`

Updates the status of a tea subscription to canceled

```
{
    "data": {
        "id": "320",
        "type": "subscription",
        "attributes": {
            "price": 34.93,
            "status": "canceled",
            "frequency": "monthly",
            "tea": {
                "id": 77,
                "name": "Lapsang Souchong",
                "description": "English Afternoon",
                "temperature": 187,
                "brew_time": 4,
                "created_at": "2021-09-22T15:48:12.197Z",
                "updated_at": "2021-09-22T15:48:12.197Z"
            }
        }
    }
}
```

## Get in touch with Zach

[![image](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/zach-trokey/)
[![image](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ztrokey)
[![image](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:ztrokey@gmail.com?subject=Exciting%20Job%20Opportunity)