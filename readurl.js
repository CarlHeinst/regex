var request = require('request');
request('https://github.com/CarlHeinst/regex/blob/master/regex%20examples.ps1', function (error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body) // Show the HTML for the Google homepage.
  }
})
