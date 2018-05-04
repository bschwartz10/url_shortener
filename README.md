
# Url Shortener

## Overview

* This application shortens long Urls. A client of this API is able to create a shortened URL from a longer Url by sending an HTTP request. A given_url parameter with a value of the long URL must be sent as part of the request.

```
http://localhost:3000/api/v1/links?given_url=http://www.espn.com/nba/boxscore?gameId=401031714
```

* As part of this HTTP request, the client may specify an optional "slug" string to use as the path portion of the shortened URL.

```
http://localhost:3000/api/v1/links?given_url=http://www.espn.com/nba/boxscore?gameId=401031714&slug=playoffs
```

* The response is a links object with the id, given_url, and slug(shortened url) properties. The return format for the endpoint is JSON.

```
{
    "id": 21,
    "given_url": "http://www.espn.com/nba/boxscore?gameId=401031714",
    "slug": "http://url-shortener.bs/playoffs"
}
```

* If a slug parameter is not specified, the slug's path is equal to the link id's base36 equivalent.

```
{
    "id": 22,
    "given_url": "http://www.espn.com/nba/boxscore?gameId=401031714",
    "slug": "http://url-shortener.bs/m"
}
```

## Setup
* To set up a local copy of this project, perform the following:

* Clone the repo in your terminal:
```
git clone https://github.com/bschwartz10/url_shortener.git
```
* Navigate into the project:
```
cd url_shortener
```
* Bundle:
```
bundle install
```
* Create the database and migrate the links table:
```
rake db:create
rake db:migrate
```

## Testing
* Run `rspec` in your terminal to ensure all tests are passing.

## API Endpoints

#### Links
- **<code>POST</code> /api/v1/links**

* You can POST a http request to the links endpoint to see a JSON response.

* Parameters - given_url, slug(optional)

* Example Request:
```
http://localhost:3000/api/v1/links?given_url=YOUR_URL_HERE&slug=YOUR_SLUG_HERE
```
* In your terminal, start a local server: `rails s`

* Open your browser to `localhost:3000`

## Libraries Used
* [rspec-rails](https://github.com/rspec/rspec-rails) - Testing framework for Rails
* [Factory Bot Rails](https://github.com/thoughtbot/factory_bot_rails) - Create factories for testing purposes
* [Figaro](https://github.com/laserlemon/figaro) - Environment configuration tool
* [Active Model Serializers](https://github.com/rails-api/active_model_serializers) - Serialize JSON endpoints
* [Validate URL](https://github.com/perfectline/validates_url) - Tool for validating URL's

## Discussion
* My goal for this project was create a simple solution that solves the current problem but is flexible to handle future requirements. The application currently has one route that points to the links_controller#create action. The endpoint has one required parameter (given_url) and one optional parameter (slug). The response is an object with the original given_url value and an additional slug value which is a shortened version of the url. This solution allows us to present the shortened url on the frontend while linking it back to the given_url on the backend.
* I chose to use the validate_url gem to ensure the url's sent in the request are in fact real urls. I am currently not standardizing given_url's. For instance, www.google.com is the same as http://google.com but my application will create two different link objects for each case. Since the project requirements didn't specify how to handle this case I chose to leave the functionality as is until future requirements specified otherwise.
* The links model is pretty bare bones right now. Additional attributes such as 'clicks' can be added to it to rank the links by popularity. If the application evolves into having a user's model, relationships can be drawn between a user and their links.
