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
    // それぞれの日付のanger_record.got_angry_onを渡す
      .then(response => response.json())
      .then(anger_records => {
        console.log("test");
        console.log(anger_records); // anger_recordsがjsonデータ

        // anger_records = JSON.parse(anger_records);

        var addRecord = function(anger_record) {
          // console.log(anger_record[0]);
          var level = document.createElement("p");
          level.className = "media"
          var record1 = document.createElement("li");

          var got_angry_on = document.createElement("p");
          got_angry_on.className = "media"
          var record2 = document.createElement("li");

          var got_angry_at = document.createElement("p");
          var record3 = document.createElement("li");

          var place = document.createElement("p");
          place.className = "media"
          var record4 = document.createElement("li");
  
          var anger_body = document.createElement("p");
          anger_body.className = "media"
          var record5 = document.createElement("li");

          var changeable = document.createElement("p");
          changeable.className = "media"
          var record6 = document.createElement("li");

          var important = document.createElement("p");
          important.className = "media"
          var record7 = document.createElement("li");
          // console.log(record);

          level.innerText = "怒りのレベル:"
          record1.innerText = anger_record["level"]

          got_angry_on.innerText = "怒った日時:"
          record2.innerText = anger_record["got_angry_on"]

          got_angry_at.innerText = "時ごろ"
          record3.innerText = anger_record["got_angry_at"]

          place.innerText = "場所:"
          record4.innerText = anger_record["place"]

          anger_body.innerText = "内容:"
          record5.innerText = anger_record["anger_body"]

          changeable.innerText = "変えらる内容か:"
          record6.innerText = anger_record["changeable"]

          important.innerText = "重要な内容か:"
          record7.innerText = anger_record["important"]
          // console.log(record.innerText);
          document.querySelector(".records").appendChild(level);
          document.querySelector(".records").appendChild(record1);

          document.querySelector(".records").appendChild(got_angry_on);
          document.querySelector(".records").appendChild(record2);

          document.querySelector(".records").appendChild(got_angry_at);
          document.querySelector(".records").appendChild(record3);

          document.querySelector(".records").appendChild(place);
          document.querySelector(".records").appendChild(record4);

          document.querySelector(".records").appendChild(anger_body);
          document.querySelector(".records").appendChild(record5);

          document.querySelector(".records").appendChild(changeable);
          document.querySelector(".records").appendChild(record6);

          document.querySelector(".records").appendChild(important);
          document.querySelector(".records").appendChild(record7);
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
