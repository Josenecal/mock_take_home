## Tea Subscription Management API

### Setup

1. fork and clone this repository
1. run `bundle` to install gems and dependencies 
1. run `rails db:create db:migrate` to create a local database
1. seed database with your comapny's customer base and tea offerings. 
1. run `rails s` 

*You are now running the API!* Pleas note these instructions are intended for local deployment on port 3000. Depending on your particular deployment solution, your base URL may be different from that noted in the instructions below.

## Endpoints

### New Subscription Endpoint

*To create a new subsciption;* send a `POST` request to `/api/v1/subscriptions` with the queary parameters `customer_id` and `tea_id` representing valid database id's for both; and a `frequency` paramater of:
* weekly
* semi_weekly
* monthly
* bi_monthly
* semi_monthly
* semi_anually

#### Example Request 

```ruby
post "http://localhost:300/api/v1/subscriptions?customer_id=1&tea_id=3&frequency=monthly"
```

#### Example Response

```json
{
    "data": {
        "id": "2",
        "type": "subscription",
        "attributes": {
            "title": "Cedric's Gen Mai Cha subscription",
            "description": "Tea delivered to 130 Green Acres Dr, Burlington, VT, 05401",
            "frequency": "monthly",
            "price": 1250,
            "status": "active",
            "created_at": "2022-08-05T06:01:15.083Z",
            "updated_at": "2022-08-05T06:01:15.083Z"
        }
    }
}
```

### Cancel Subscription Endpoint

*To cancel an existing subscription;* send a `PATCH` request to `http://localhost:300/api/v1/subscriptions` with a valid `subscription_id` queary parameter. If found, the subscription's status will be updated to `cancelled`

#### Example Request

```ruby
    patch "http://localhost:300/api/v1/subscriptions?subscription_id=2"
```

#### Example Response

```json
{
    "data": {
        "id": "2",
        "type": "subscription",
        "attributes": {
            "title": "Cedric's Gen Mai Cha subscription",
            "description": "Tea delivered to 130 Green Acres Dr, Burlington, VT, 05401",
            "frequency": "monthly",
            "price": 1250,
            "status": "cancelled",
            "created_at": "2022-08-05T06:01:15.083Z",
            "updated_at": "2022-08-05T06:29:15.725Z"
        }
    }
}
```

### Pull A User's Subscriptions

*To reques a complete list of a user's subscriptions, active and cancelled;* send a `GET` request to `"http://localhost:300/api/v1/subscriptions"` with a valid user ID. It will return a list list of all subscriptions ordered by `created_at` by default. 

#### Example Request

```ruby
get "http://localhost:300/api/v1/subscriptions?customer_id=1"
```

#### Example Response

```json
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "Gen Mai Cha Monthly",
                "description": "whoops",
                "frequency": "bi_monthly",
                "price": 2100,
                "status": "active",
                "created_at": "2022-08-05T03:22:08.244Z",
                "updated_at": "2022-08-05T03:22:08.244Z"
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "title": "Cedric's Gen Mai Cha subscription",
                "description": "Tea delivered to 130 Green Acres Dr, Burlington, VT, 05401",
                "frequency": "monthly",
                "price": 1250,
                "status": "active",
                "created_at": "2022-08-05T06:01:15.083Z",
                "updated_at": "2022-08-05T06:01:15.083Z"
            }
        }
    ]
}
```

## Database 

<img width="850" alt="Screen Shot 2022-08-05 at 12 59 48 AM" src="https://user-images.githubusercontent.com/70451678/183022267-c31a5599-29eb-4c92-81a0-01891cbd2c87.png">


The Schema for this PostgreSQL database is a simple many-to-many setup with subscriptions connecting one single customer to one tea. Given the constraints of the prompt, there is no way to tailor a quantity, and so assuming that each tea is sold in a fixed quantity and therefore an equal price (for simplicity's sake), price was therefore based entirely upon the user's indicated `frequency` parameter, incorporating a slight logorithmic discount scale with quantity purchased and calculating price for an assumed monthly billing cycle. These are all set in the method `::price_setter(freq)` in  `app/models/subscription.rb`
