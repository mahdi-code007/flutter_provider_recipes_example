# flutter_provider_example

A simple application to fetch Recipes and display it in a list using Provider
This is a project to train on Provider package and discover all its details

* [Demp (apk)](https://www.mediafire.com/file/fvj7rda1j5eewtb/Recipes+App+With+Provider.apk/file)

## project structure
<img src="https://i.ibb.co/48Cszsp/Untitled.png">&nbsp;

## Screenshots
<img src="https://i.ibb.co/nRvmQzz/Screenshot-1691837332.png" width="250">&nbsp;
<img src="https://i.ibb.co/7ndqYDv/Screenshot-1691837346.png" width="250">&nbsp;
<img src="https://i.ibb.co/SwV89zV/Screenshot-1691837350.png" width="250">&nbsp;

## Integrating API with an app
Now, we can finally begin to integrate API with an app. We are going to use a [Yummly](https://rapidapi.com/apidojo/api/yummly2) API to receive recipes. So, go to the Yummly API and register there, the price is free for 500 requests per month. So, you will be able to make only 500 requests for free within your account.

Now, what we are going to use from this API is GET feeds/list. A quick note, I will blur the x-rapidapi-key because of the limitation of 500 requests. So, use your own key.

<img src="https://i.ibb.co/vxrXYpV/oflutter-yummly-1024x545.png" width="720">&nbsp;
## Built With

* [Provider](https://pub.dev/packages/provider/example) -A wrapper around InheritedWidget to make them easier to use and more reusable.
* [Http Package](https://pub.dev/packages/http) - A composable, multi-platform, Future-based API for HTTP requests.
