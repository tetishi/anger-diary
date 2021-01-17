document.addEventListener('DOMContentLoaded', function(){
  // var click_count = 0;

  // function myClick(event) {
  //   click_count++;
  //   if(click_count == 1) {
  //     links.removeEventListener('"click', myClick);
  //   }
  // }

  document.querySelectorAll(".dates").forEach(function (links) {
    // this.removeEventListener("click", foo)
    links.addEventListener("click", function foo() {
      // this.removeEventListener("click", foo)
      // e.preventDefault();
      // var angerDate = document.querySelector(".data-json").getAttribute("data-json");
    // // fetch("http://localhost:3000/calendars.json?hoge=20201030")
      // debugger;

      // var calendarRecords = document.querySelector(".records");
      var calendarRecord = document.querySelectorAll(".test");
      if (calendarRecord) {
        // calendarRecords.removeChild(calendarRecord);

        for (const elem of calendarRecord) {
          elem.remove();
        }
        // forで回す
        // calendarRecord.remove();
      }
      // if 記録がすでに表示されていれば records.exists?的な
      //   その記録を非表示にする
      // end

      // removeEventListenerはイベントリスナーの削除であって追加した要素の削除ではない
      fetch(`http://localhost:3000/calendars.json?date=${this.title}`)
        .then(response => response.json())
        .then(anger_records => {
          console.log("test");
          console.log(anger_records); // anger_recordsがjsonデータ
          // debugger;
          // this.removeEventListener("click", foo)

          var getRecord = function(anger_record) {
            var level = document.createElement("div");
            level.className = "test"
            var got_angry_on = document.createElement("div");
            got_angry_on.className = "test"
            var place = document.createElement("div");
            place.className = "test"
            var anger_body = document.createElement("div");
            anger_body.className = "test"
            var changeable = document.createElement("div");
            changeable.className = "test"
            var important = document.createElement("div");
            important.className = "test"
            var buttons = document.createElement("div");
            buttons.className = "test"
         
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
                                 "<a data-confirm='本当によろしいですか？' class='button is-danger is-size-5' rel='nofollow' data-method='delete' href='/anger_records/:id'>" +
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
          // this.removeEventListener("click", foo)
          // debugger;
          // if anger_records <= 2
          // Array.from(anger_records).forEach(function(anger_record){getRecord(anger_record)})
          anger_records.forEach(function(anger_record){getRecord(anger_record)})
          // getRecord(anger_record);
          // debugger;
          // this.removeEventListener("click", foo)
        })
        .catch(error => alert(error));
    });
    // debugger;
    // }, { once: true });
    // links.removeEventListener("click");
    // this.removeEventListener("click", foo)
  });
});
