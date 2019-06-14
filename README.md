# Movie List Web Sample

## API
https://api.androidhive.info/json/movies.json

## Screenshots
<img src='Screen Shot 2019-06-15 at 12.21.22 AM.png' />
<img src='Screen Shot 2019-06-15 at 12.21.40 AM.png' />

## Steps to run the project
1. Clone this repo
2. Run Packages get
3. Open the Chrome browser with the command on MAC `open /Applications/Google\ Chrome.app --args --disable-web-security --user-data-dir`
4. We used the above command because when fetching the data from API, Chrome passes additional parameters to the request which results in `XMHttpRequestError`. You can check the issue at: https://github.com/flutter/flutter/issues/32892