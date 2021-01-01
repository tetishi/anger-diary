// console.log("test");
// alert("test");

const btn = document.querySelector("records");

btn.addEventListener("click", () => {
  fetch("http://localhost:3000/calendars")
    .then(response => response.json())
    .then(anger_records => {
      for (const anger_record of anger_records) {
        return anger_record
      }
    })
    .catch(error => alert(error));
});


// fetch("http://localhost:300/calendars", {
//   method: "GET"
// })
//   .then(response => {
//     return response.json();
// })
//   .then(data => {
//     const angerRecords = Object.
//   })
//   .then(json => {
//     if(this.anger_record) {
//       json.forEach(c => {
//         this.anger_record.push(c);
//       });
//     }
//     if(this.success_record) {
//       return this.success_record
//     }
//   })
//   .catch(error => {
//     console.error(error)
//   });
