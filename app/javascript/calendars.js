// console.log("test");
// alert("test");


// ele.addEventListener("click", function(e)
// {e.preventDefault();console.log("hi")});

document.addEventListener('DOMContentLoaded', function(){
  const links = document.querySelector(".dates");
  const calendarURL = "http://localhost:3000/calendars.json"
  // let recordDate = this.anger_record.got_angry_on

  // anger_record.got_angry_onのリソースをとってくる
  // console.log(links);
  links.addEventListener("click", function(e) {
    e.preventDefault();
    console.log("hi");
    // fetch("http://localhost:3000/calendars.json?hoge=20201030")
    // fetch(`http://localhost:3000/calendars.json?record=${record_date}`)
    // fetch(calendarURL + "/" + recordDate)
    fetch(calendarURL)
    // それぞれの日付のanger_record.got_angry_onを渡す
      .then(response => response.json())
      .then(anger_records => {
        console.log("test");
        console.log(anger_records); // anger_recordsがjsonデータ

        // anger_records = JSON.parse(anger_records);

        var addRecord = function(anger_record) {
          // console.log(anger_record[0]);
          var record1 = document.createElement("li");
          var record2 = document.createElement("li");
          var record3 = document.createElement("li");
          var record4 = document.createElement("li");
          var record5 = document.createElement("li");
          var record6 = document.createElement("li");
          var record7 = document.createElement("li");
          // console.log(record);
          record1.innerText = anger_record["level"]
          record2.innerText = anger_record["got_angry_on"]
          record3.innerText = anger_record["got_angry_at"]
          record4.innerText = anger_record["place"]
          record5.innerText = anger_record["anger_body"]
          record6.innerText = anger_record["changeable"]
          record7.innerText = anger_record["important"]
          // console.log(record.innerText);
          document.querySelector(".records").appendChild(record1);
          document.querySelector(".records").appendChild(record2);
          document.querySelector(".records").appendChild(record3);
          document.querySelector(".records").appendChild(record4);
          document.querySelector(".records").appendChild(record5);
          document.querySelector(".records").appendChild(record6);
          document.querySelector(".records").appendChild(record7);
        }
        

        anger_records.forEach(function(anger_record){addRecord(anger_record)})

        // for (const anger_record of anger_records) {
        //   return anger_record
        // }
      })
      .catch(error => alert(error));
  });
});
