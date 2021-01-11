document.addEventListener('DOMContentLoaded', function(){

  // var links = document.querySelectorAll(".dates");
  var calendarURL = "http://localhost:3000/calendars.json"

  document.querySelectorAll(".dates").forEach(function (links) {
    links.addEventListener("click", function(e) {
      e.preventDefault();
      console.log("hi");
    // fetch("http://localhost:3000/calendars.json?hoge=20201030")
    // fetch(`http://localhost:3000/calendars.json?record=${record_date}`)
    // fetch(calendarURL + "/" + recordDate)
      fetch(calendarURL)
        .then(response => response.json())
        .then(anger_records => {
          console.log("test");
          console.log(anger_records); // anger_recordsがjsonデータ

          var addRecord = function(anger_record) {
            var level = document.createElement("div");

            var got_angry_on = document.createElement("div");

            var place = document.createElement("div");
  
            var anger_body = document.createElement("div");

            var changeable = document.createElement("div");

            var important = document.createElement("div");

            var buttons = document.createElement("div");
         
            level.innerHTML = "<p class='media'>" +
                            "<strong class='media-left'>" +
                            "怒りのレベル:" +
                            "</strong><spam class='media-left'>" +
                            "</spam>" +
                            anger_record["level"] +
                            "</p>"
          // record1.innerText = anger_record.sort()
          

            got_angry_on.innerHTML = "<p class='media'>" +
                                   "<strong class='media-left'>" +
                                   "怒った日時:" +
                                   "</strong>" +
                                   "<spam class='media-left'>" +
                                   "</spam>" +
                                   anger_record["got_angry_on"] +
                                   " " +
                                   new Date(anger_record["got_angry_at"]).getHours() +
                                   "時ごろ" + 
                                   "</p>"

            place.innerHTML = "<p class='media'>" +
                            "<strong class='media-left'>" +
                            "場所:" +
                            "</strong>" +
                            "<spam class='media-left'>" +
                            "</spam>" +
                            anger_record["place"] +
                            "</p>"

            anger_body.innerHTML = "<p class='media'>" +
                                 "<strong class='media-left'>" +
                                 "内容:" +
                                 "</strong>" +
                                 "<spam class='media-left'>" +
                                 "</spam>" +
                                 anger_record["anger_body"] +
                                 "</p>"

            changeable.innerHTML = "<p class='media'>" +
                                 "<strong class='media-left'>" +
                                 "変えらる内容か:" +
                                 "</strong>" +
                                 "<spam class='media-left'>" +
                                 "</spam>" +
                                 anger_record["changeable"] +
                                 "</p>"

            important.innerHTML = "<p class='media'>" +
                                "<strong class='media-left'>" +
                                "重要な内容か:" +
                                "</strong>" +
                                "<spam class='media-left'>" +
                                "</spam>" +
                                anger_record["important"] +
                                "</p>"

            buttons.innerHTML = "<div class='field is-grouped my-5'>" +
                                 "<div class='control'>" +
                                 "<a class='button is-primary is-size-5' href='/calendars/2021-01-07/anger_records/5/edit'>" +
                                 "編集" +
                                 "</a>" +
                                 "</div>" +
                                 "<div class='control'>" +
                                 "<a data-confirm='本当によろしいですか？' class='button is-danger is-size-5' rel='nofollow' data-method='delete' href='/anger_records/5'>" +
                                 "削除" +
                                 "</a>" +
                                 "</div>" +
                                 "</div>"
                                 //  edit_calendar_anger_record_path(anger_record.got_angry_on, anger_record.id)

            document.querySelector(".records").appendChild(level);

            document.querySelector(".records").appendChild(got_angry_on);

            document.querySelector(".records").appendChild(place);

            document.querySelector(".records").appendChild(anger_body);

            document.querySelector(".records").appendChild(changeable);

            document.querySelector(".records").appendChild(important);

            document.querySelector(".records").appendChild(buttons);
          }
          anger_records.forEach(function(anger_record){addRecord(anger_record)})
        })
        .catch(error => alert(error));
    }, { once: true });
  });
});
