document.addEventListener("turbolinks:load", function() {
  const angerEditButtons = document.querySelectorAll(".js-anger-edit-button");
  if(angerEditButtons) {
    angerEditButtons.forEach(function (editButton) {
      editButton.addEventListener("click", function() {
            // debugger;
        const angerRecordId = document.getElementById('anger-record').getAttribute('data-record');
        const angerRecordLevel = document.getElementById('js-anger-record-level-' + angerRecordId);
        const angerRecordDate = document.getElementById('js-anger-record-date-' + angerRecordId);
        const angerRecordPlace = document.getElementById('js-anger-record-place-' + angerRecordId);
        const angerRecordBody = document.getElementById('js-anger-record-body-' + angerRecordId);
        const angerRecordChangeable = document.getElementById('js-anger-record-changeable-' + angerRecordId);
        const angerRecordImportant = document.getElementById('js-anger-record-important-' + angerRecordId);
        const angerRecordButton = document.getElementById('anger-record-button-' + angerRecordId);

            // const angerUpdateButton = document.getElementById('js-anger-update-button-' + angerRecordId); ここおこここ

        const angerRecordFormLevel = document.getElementById('anger-record-form-level-' + angerRecordId);
        const angerRecordFormDate = document.getElementById('anger-record-form-date-' + angerRecordId);
        const angerRecordFormPlace = document.getElementById('anger-record-form-place-' + angerRecordId);
        const angerRecordFormBody = document.getElementById('anger-record-form-body-' + angerRecordId);
        const angerRecordFormChangeable = document.getElementById('anger-record-form-changeable-' + angerRecordId);
        const angerRecordFormImportant = document.getElementById('anger-record-form-important-' + angerRecordId);

        const angerRecordUpdateButton = document.getElementById('js-anger-record-button-' + angerRecordId);

        console.log(angerRecordId);
        angerRecordLevel.style.display = 'none';
        angerRecordDate.style.display = 'none';
        angerRecordPlace.style.display = 'none';
        angerRecordBody.style.display = 'none';
        angerRecordChangeable.style.display = 'none';
        angerRecordImportant.style.display = 'none';
        angerRecordButton.style.display = 'none';
        angerRecordFormLevel.style.display = '';
        angerRecordFormDate.style.display = '';
        angerRecordFormPlace.style.display = '';
        angerRecordFormBody.style.display = '';
        angerRecordFormChangeable.style.display = '';
        angerRecordFormImportant.style.display = '';

        angerRecordUpdateButton.style.display = '';
      })
    })
  }

  const angerCancelButton = document.getElementById("anger-cancel-button");
  if(angerCancelButton) {
    angerCancelButton.addEventListener("click", function() {
      const angerRecordId = document.getElementById('anger-record').getAttribute('data-record');
      const angerRecordLevel = document.getElementById('js-anger-record-level-' + angerRecordId);
      const angerRecordDate = document.getElementById('js-anger-record-date-' + angerRecordId);
      const angerRecordPlace = document.getElementById('js-anger-record-place-' + angerRecordId);
      const angerRecordBody = document.getElementById('js-anger-record-body-' + angerRecordId);
      const angerRecordChangeable = document.getElementById('js-anger-record-changeable-' + angerRecordId);
      const angerRecordImportant = document.getElementById('js-anger-record-important-' + angerRecordId);
      const angerRecordButton = document.getElementById('anger-record-button-' + angerRecordId);
      const angerRecordFormLevel = document.getElementById('anger-record-form-level-' + angerRecordId);
      const angerRecordFormDate = document.getElementById('anger-record-form-date-' + angerRecordId);
      const angerRecordFormPlace = document.getElementById('anger-record-form-place-' + angerRecordId);
      const angerRecordFormBody = document.getElementById('anger-record-form-body-' + angerRecordId);
      const angerRecordFormChangeable = document.getElementById('anger-record-form-changeable-' + angerRecordId);
      const angerRecordFormImportant = document.getElementById('anger-record-form-important-' + angerRecordId);
      const angerRecordUpdateButton = document.getElementById('js-anger-record-button-' + angerRecordId);

      angerRecordLevel.style.display = '';
      angerRecordDate.style.display = '';
      angerRecordPlace.style.display = '';
      angerRecordBody.style.display = '';
      angerRecordChangeable.style.display = '';
      angerRecordImportant.style.display = '';
      angerRecordButton.style.display = '';
      angerRecordFormLevel.style.display = 'none';
      angerRecordFormDate.style.display = 'none';
      angerRecordFormPlace.style.display = 'none';
      angerRecordFormBody.style.display = 'none';
      angerRecordFormChangeable.style.display = 'none';
      angerRecordFormImportant.style.display = 'none';
      angerRecordUpdateButton.style.display = 'none';
    })
  }

  const angerUpdateButton = document.querySelector(".anger-update-button");
  if(angerUpdateButton) {
    angerUpdateButton.addEventListener("click", function() {
      const angerRecordId = document.getElementById('anger-record').getAttribute('data-record');
      const angerRecordDate = document.getElementById('js-anger-update-button').getAttribute('data-record');

      const level = document.getElementById('anger-record-form-level-' + angerRecordId).value;
      const gotAngryOn = document.getElementById('anger-record-form-date-' + angerRecordId).value;
      const gotAngryAt = document.getElementById('anger-record-form-hour-' + angerRecordId).value;
      const place = document.getElementById('anger-record-form-place-' + angerRecordId).value;
      const angerBody = document.getElementById('anger-record-form-body-' + angerRecordId).value;
      const changeable = document.getElementById('anger-record-form-changeable-' + angerRecordId).value;
      const important = document.getElementById('anger-record-form-important-' + angerRecordId).value;

          // // const successRecordId = document.getElementById('success-record').getAttribute('data-record');
          // const successRecordDate = document.getElementById('success-record').getAttribute('data-record');
          // const textField = document.getElementById('textarea-body-' + successRecordDate);
          // // const body = textField.textContent;
          // const body = textField.value
          // console.log(successRecordDate);
          // console.log(body);
          // // console.log(textField);
          // // debugger;

      let bodyData = {
        'level': level,
        'got_anger_on': gotAngryOn,
        'got_angry_at': gotAngryAt,
        'place': place,
        'anger_body': angerBody,
        'changeable': changeable,
        'important': important
      }
          // // debugger;
          // // fetch(`http://localhost3000/success_records/${successRecordId}`, {
      fetch(`http://localhost:3000/calendars/${angerRecordDate}`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(bodyData)
      })
      .then(response => response.json())
      .then(data => {
        console.log(data)
        //   const successRecordLabelArea = document.getElementById('success-record-label');
        //   const successRecordButton = document.getElementById('success-record-button');
        //   const successRecordForm = document.getElementById('success-record-form');
        //   const successRecordError = document.getElementById('js-success-record-post-error');

        //   successRecordLabelArea.style.display = '';
        //   successRecordLabelArea.textContent = data.success_body;
        //   successRecordButton.style.display = '';
        //   successRecordForm.style.display = 'none';
        //   successRecordError.style.display = 'none';
      })
          // .catch(error => {
          //   console.log(error.message)
          //   const successRecordError = document.getElementById('js-success-record-post-error');
          //   successRecordError.textContent = '出来たことを入力してください'
          // })
    })
  }
})
