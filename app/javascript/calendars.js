document.addEventListener("DOMContentLoaded", function() {
  document.querySelectorAll(".edit-button").forEach(function (editButton) {
    editButton.addEventListener("click", function() {
    //   var 
      debugger;
      fetch(`http://localhost3000/anger_records/${this.id}/edit`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify()
      })
      .then(response => {
        return response.json()
      })
      .then(data =>
        console.log(data)
      );
    })
  })
})
