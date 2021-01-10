document.addEventListener('DOMContentLoaded', function(){
  // var recordDate = document.querySelector(".record_dates");

  var links = document.querySelector(".dates");
  var calendarURL = "http://localhost:3000/calendars.json"

  // p.media
  //   strong.media-left
  //     | 怒りのレベル:
  //   spam.media-left
  //   = anger_record.level

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

        // anger_records = JSON.parse(anger_records);

        var addRecord = function(anger_record) {
          var level = document.createElement("div");
          // level.className = "media"
          // var record1 = document.createElement("li");
          // record1.className = "media-left"

          var got_angry_on = document.createElement("div");
          // got_angry_on.className = "media"
          // var record2 = document.createElement("li");
          // record2.className = "media-left"

          // var got_angry_at = document.createElement("div");
          // var record3 = document.createElement("p");
          // record3.className = "media-left"

          var place = document.createElement("div");
          // place.className = "media"
          // var record4 = document.createElement("li");
          // record4.className = "media-left"
  
          var anger_body = document.createElement("div");
          // anger_body.className = "media"
          // var record5 = document.createElement("li");
          // record5.className = "media-left"

          var changeable = document.createElement("div");
          // changeable.className = "media"
          // var record6 = document.createElement("li");
          // record6.className = "media-left"

          var important = document.createElement("div");
          // important.className = "media"
          // var record7 = document.createElement("li");
          // record7.className = "media-left"

          var buttons = document.createElement("div");
          // buttons.className = "field is-grouped my-5"
          // var editButton = document.createElement("div");
          // editButton.className = "control"
          // var deleteButton = document.createElement("div");
          // deleteButton.className = "control"

         
          level.innerHTML = "<p class='media'>" +
                            "<strong class='media-left'>" +
                            "怒りのレベル:" +
                            "</strong><spam class='media-left'>" +
                            "</spam>" +
                            anger_record["level"] +
                            "</p>"
          // record1.innerText = anger_record["level"]

          // record1.innerText = anger_record.sort()
          

          got_angry_on.innerHTML = "<p class='media'>" +
                                   "<strong class='media-left'>" +
                                   "怒った日時:" +
                                   "</strong>" +
                                   "<spam class='media-left'>" +
                                   "</spam>" +
                                   anger_record["got_angry_on"] +
                                   " " +
                                   new Date(anger_record["got_angry_at"]).getHours(); +
                                   "時ごろ" + 
                                   "</p>"
          // record2.innerText = anger_record["got_angry_on"]

          // got_angry_at.innerHTML = "時ごろ"
          // record3.innerHTML = "<time datetime='hh'></time>"
          // record3.innerHTML = "<time datetime='hh'>anger_record['got_angry_at']</time>"
          // record3.innerHTML = anger_record["got_angry_at"]

          // record3.innerHTML = new Date(anger_record["got_angry_at"]).getHours();

          // debugger;

          place.innerHTML = "<p class='media'>" +
                            "<strong class='media-left'>" +
                            "場所:" +
                            "</strong>" +
                            "<spam class='media-left'>" +
                            "</spam>" +
                            anger_record["place"] +
                            "</p>"
          // record4.innerText = anger_record["place"]

          anger_body.innerHTML = "<p class='media'>" +
                                 "<strong class='media-left'>" +
                                 "内容:" +
                                 "</strong>" +
                                 "<spam class='media-left'>" +
                                 "</spam>" +
                                 anger_record["anger_body"] +
                                 "</p>"
          // record5.innerText = anger_record["anger_body"]

          changeable.innerHTML = "<p class='media'>" +
                                 "<strong class='media-left'>" +
                                 "変えらる内容か:" +
                                 "</strong>" +
                                 "<spam class='media-left'>" +
                                 "</spam>" +
                                 anger_record["changeable"] +
                                 "</p>"
          // record6.innerText = anger_record["changeable"]

          important.innerHTML = "<p class='media'>" +
                                "<strong class='media-left'>" +
                                "重要な内容か:" +
                                "</strong>" +
                                "<spam class='media-left'>" +
                                "</spam>" +
                                anger_record["important"] +
                                "</p>"
          // record7.innerText = anger_record["important"]

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

          document.querySelector(".records").appendChild(level);
          // level.appendChild(record1);

          // debugger;
          document.querySelector(".records").appendChild(got_angry_on);
          // got_angry_on.appendChild(record2);
          // got_angry_on.appendChild(record3);
          // document.querySelector(".records").appendChild(got_angry_at);
          // document.querySelector(".records").appendChild(moment(record3).format('HH'));

          document.querySelector(".records").appendChild(place);
          // place.appendChild(record4);

          document.querySelector(".records").appendChild(anger_body);
          // anger_body.appendChild(record5);

          document.querySelector(".records").appendChild(changeable);
          // changeable.appendChild(record6);

          document.querySelector(".records").appendChild(important);
          // important.appendChild(record7);

          document.querySelector(".record-buttons").appendChild(buttons);
        }
        anger_records.forEach(function(anger_record){addRecord(anger_record)})
      })
      .catch(error => alert(error));
  });
});



// - if @anger_record.present?
//         div.is-size-2.is-size-3-touch.is-bold.media
//           | #{@anger_record.got_angry_on}
//         - @anger_records.each do |anger_record|
//           div.notice id='anger_record-#{anger_record.id}'
//             = render partial: 'anger_record', locals: { anger_record: anger_record }
//             .field.is-grouped.my-5
//               .control
//                 = link_to '編集', edit_calendar_anger_record_path(anger_record.got_angry_on, anger_record.id), class: 'button is-primary is-size-5'
//               .control
//                 = link_to '削除', anger_record_path(anger_record), method: :delete, data: { confirm: '本当によろしいですか？' }, remote: true, class: 'button is-danger is-size-5'
