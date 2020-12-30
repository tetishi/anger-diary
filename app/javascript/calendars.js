fetch("http://localhost:300/calendars", {
  method: "GET"
})
  .then(response => {
    return response.json();
})
  .then(json => {
    json.forEach(c => {
      
    });
  })
  .catch(error => {
    console.error(error)
  });
