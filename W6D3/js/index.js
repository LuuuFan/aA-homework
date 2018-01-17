console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  type: 'GET',
  // url: 'http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b',
  // url: 'http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=be182788a8d4e2a8a2a1803c42eea32c',
  url: 'http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=882a1d17c8a1648dc6c2f50b3858e3b2',
  success(data) {
      console.log("We have your weather!");
      console.log(data);
    },
    error() {
      console.error("An error occurred.");
    },
});
// Add another console log here, outside your AJAX request
console.log('Outside AJAX request');
