// console.log("test");
// alert("test");


// ele.addEventListener("click", function(e)
// {e.preventDefault();console.log("hi")});

document.addEventListener('DOMContentLoaded', function(){
  const links = document.querySelector(".records");
  const calendarURL = "http://localhost:3000/calendars.json"
  let recordDate = this.anger_record.got_angry_on

  // anger_record.got_angry_onのリソースをとってくる
  console.log(links);
  links.addEventListener("click", function(e) {
    e.preventDefault();
    console.log("hi");
    // fetch("http://localhost:3000/calendars.json?hoge=20201030")
    // fetch(`http://localhost:3000/calendars.json?record=${record_date}`)
    fetch(calendarURL + "/" + recordDate)
    // それぞれの日付のanger_record.got_angry_onを渡す
      .then(response => response.json())
      .then(anger_records => {
        console.log("test");
        console.log(anger_records);
        for (const anger_record of anger_records) {
          return anger_record
          // データをとってきてArrayにいれる
        }
      })
      .catch(error => alert(error));
  });
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
