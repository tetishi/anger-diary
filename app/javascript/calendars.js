fetch("http://localhost:300/calendars.json", {
  method: "GET"
})
  .then(response => {
    return response.json();
})
  .then(json => {
    if(this.anger_record) {
      json.forEach(c => {
        this.anger_record.push(c);
      });
    }
    if(this.success_record) {
      return this.success_record
    }
  })
  .catch(error => {
    console.error(error)
  });
