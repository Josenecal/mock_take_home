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

To create a new subsciption, send a `POST` request to `/api/v1/subscriptions` with the queary parameters `customer_id` and `tea_id` representing valid database id's for both. 

#### Example Request 

```ruby
post "http://localhost:300/api/v1/subscriptions?customer_id=1&tea_id=3
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