document.addEventListener("turbolinks:load", function() {
  const angerEditButtons = document.querySelectorAll(".js-anger-edit-button");
  if(angerEditButtons) {
    angerEditButtons.forEach(function (editButton) {
      editButton.addEventListener("click", function() {
            // debugger;
        const angerId = document.getElementById('anger-record').getAttribute('data-record');
        const angerLevel = document.getElementById('js-anger-level-' + angerId);
        const angerDate = document.getElementById('js-anger-date-' + angerId);
        const angerPlace = document.getElementById('js-anger-place-' + angerId);
        const angerBody = document.getElementById('js-anger-body-' + angerId);
        const angerChangeable = document.getElementById('js-anger-changeable-' + angerId);
        const angerImportant = document.getElementById('js-anger-important-' + angerId);
        const twoAngerButton = document.getElementById('js-two-anger-button-' + angerId);

        const angerRecordFormLevel = document.getElementById('anger-record-form-level-' + angerId);
        const angerRecordFormDate = document.getElementById('anger-record-form-date-' + angerId);
        const angerRecordFormPlace = document.getElementById('anger-record-form-place-' + angerId);
        const angerRecordFormBody = document.getElementById('anger-record-form-body-' + angerId);
        const angerRecordFormChangeable = document.getElementById('anger-record-form-changeable-' + angerId);
        const angerRecordFormImportant = document.getElementById('anger-record-form-important-' + angerId);

        const angerUpdateButton = document.getElementById('js-anger-update-button-' + angerId);
        const angerCancelButton = document.getElementById('js-anger-cancel-button-' + angerId);

        console.log(angerId);
        angerLevel.style.display = 'none';
        angerDate.style.display = 'none';
        angerPlace.style.display = 'none';
        angerBody.style.display = 'none';
        angerChangeable.style.display = 'none';
        angerImportant.style.display = 'none';
        twoAngerButton.style.display = 'none';
        angerRecordFormLevel.style.display = '';
        angerRecordFormDate.style.display = '';
        angerRecordFormPlace.style.display = '';
        angerRecordFormBody.style.display = '';
        angerRecordFormChangeable.style.display = '';
        angerRecordFormImportant.style.display = '';

        angerUpdateButton.style.display = '';
        angerCancelButton.style.display = '';
      })
    })
  }

  const angerCancelButton = document.getElementById("anger-cancel-button");
  if(angerCancelButton) {
    angerCancelButton.addEventListener("click", function() {
      const angerId = document.getElementById('anger-record').getAttribute('data-record');
      const angerLevel = document.getElementById('js-anger-level-' + angerId);
      const angerDate = document.getElementById('js-anger-date-' + angerId);
      const angerPlace = document.getElementById('js-anger-place-' + angerId);
      const angerBody = document.getElementById('js-anger-body-' + angerId);
      const angerChangeable = document.getElementById('js-anger-changeable-' + angerId);
      const angerImportant = document.getElementById('js-anger-important-' + angerId);
      const twoAngerButton = document.getElementById('js-two-anger-button-' + angerId);
      const angerRecordFormLevel = document.getElementById('anger-record-form-level-' + angerId);
      const angerRecordFormDate = document.getElementById('anger-record-form-date-' + angerId);
      const angerRecordFormPlace = document.getElementById('anger-record-form-place-' + angerId);
      const angerRecordFormBody = document.getElementById('anger-record-form-body-' + angerId);
      const angerRecordFormChangeable = document.getElementById('anger-record-form-changeable-' + angerId);
      const angerRecordFormImportant = document.getElementById('anger-record-form-important-' + angerId);
      const angerUpdateButton = document.getElementById('js-anger-update-button-' + angerId);
      const angerCancelButton = document.getElementById('js-anger-cancel-button-' + angerId);

      angerLevel.style.display = '';
      angerDate.style.display = '';
      angerPlace.style.display = '';
      angerBody.style.display = '';
      angerChangeable.style.display = '';
      angerImportant.style.display = '';
      twoAngerButton.style.display = '';
      angerRecordFormLevel.style.display = 'none';
      angerRecordFormDate.style.display = 'none';
      angerRecordFormPlace.style.display = 'none';
      angerRecordFormBody.style.display = 'none';
      angerRecordFormChangeable.style.display = 'none';
      angerRecordFormImportant.style.display = 'none';
      angerUpdateButton.style.display = 'none';
      angerCancelButton.style.display = 'none';
    })
  }

  const angerUpdateButton = document.querySelector(".anger-update-button");
  if(angerUpdateButton) {
    angerUpdateButton.addEventListener("click", function() {
      const angerId = document.getElementById('anger-record').getAttribute('data-record');
      const angerDate = document.getElementById('js-anger-update-button').getAttribute('data-record');

      const level = document.getElementById('anger-record-form-level-' + angerId).value;
      const gotAngryOn = document.getElementById('anger-record-form-date-' + angerId).value;
      const gotAngryAt = document.getElementById('anger-record-form-hour-' + angerId).value;
      const place = document.getElementById('anger-record-form-place-' + angerId).value;
      const angerBody = document.getElementById('anger-record-form-body-' + angerId).value;
      const changeable = document.getElementById('anger-record-form-changeable-' + angerId).value;
      const important = document.getElementById('anger-record-form-important-' + angerId).value;

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
      fetch(`http://localhost:3000/calendars/${angerDate}`, {
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
