# POST /sort-names Route Design Recipe

## 1. Design the Route Signature

You'll need to include:
  * POST
  * /sort-names
  * Body params: names=Joe,Alice,Zoe,Julia,Kieran

## 2. Design the Response

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code.

```html
<!-- Response when the post is found: 200 OK -->

when body param 'name' = z,b,x,a,t,a,c return = a,a,b,c,t,x,z

```

```html
<!-- Response when the post is not found: 404 Not Found -->

```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

POST /sort-names

# Expected response:

Response for 200 OK
```

```
# Request:

POST /sort-namessss

# Expected response:

Response for 404 Not Found
```

```
# Request:

POST /sort-names?names=Joe,Alice,Zoe,Julia,Kieran

# Expected response:

Response for 200 OK 

Alice,Joe,Julia,Kieran,Zoe

```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/app_spec.rb

require "spec_helper"
require 'spec_helper'
require 'rack/test'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /sort-names" do
    it 'returns 200 OK' do
      response = post('/sort-names')

      expect(response.status).to eq(200)
    end

    it 'returns 404 Not Found' do
      response = post('/sort-namesss')

      expect(response.status).to eq(404)
    end

    it 'returns a list of sorted param names' do
      response = post('/sort-names?names=Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end
end
```

## 5. Implement the Route

_Write the route and web server code to implement the route behaviour._