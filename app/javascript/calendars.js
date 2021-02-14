document.addEventListener("turbolinks:load", function() {
  document.querySelectorAll(".success-edit-button").forEach(function (editButton) {
    editButton.addEventListener("click", function() {
      const successRecordLabelArea = document.getElementById('success-record-label');
      const successRecordButton = document.getElementById('success-record-button');
      const successRecordTextArea = document.getElementById('success-record-textarea');
      const successUpdateCancelButton = document.getElementById('success-update-cancel-button');

      successRecordLabelArea.style.display = 'none';
      successRecordButton.style.display = 'none';
      successRecordTextArea.style.display = '';
      successUpdateCancelButton.style.display = '';
    })
  })

  document.getElementById("cancel-button").addEventListener("click", function() {
    const successRecordLabelArea = document.getElementById('success-record-label');
    const successRecordButton = document.getElementById('success-record-button');
    const successRecordTextArea = document.getElementById('success-record-textarea');
    const successUpdateCancelButton = document.getElementById('success-update-cancel-button');
    const successRecordError = document.getElementById('js-success-record-post-error');

    successRecordLabelArea.style.display = '';
    successRecordButton.style.display = '';
    successRecordTextArea.style.display = 'none';
    successUpdateCancelButton.style.display = 'none';
    successRecordError.style.display = 'none';
  })

  document.querySelector(".submit-update-button").addEventListener("click", function() {
    const successRecordDate = document.getElementById('success-record').getAttribute('data-record');
    const textField = document.getElementById('textarea-body-' + successRecordDate);
    const body = textField.value

    let bodyData = {
      'success_body': body
    }

    fetch(`http://localhost:3000/calendars/${successRecordDate}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(bodyData)
    })
    .then(response => response.json())
    .then(data => {
      // console.log(data)
      const successRecordLabelArea = document.getElementById('success-record-label');
      const successRecordButton = document.getElementById('success-record-button');
      const successRecordTextArea = document.getElementById('success-record-textarea');
      const successUpdateCancelButton = document.getElementById('success-update-cancel-button');
      const successRecordError = document.getElementById('js-success-record-post-error');

      successRecordLabelArea.style.display = '';
      successRecordLabelArea.textContent = data.success_body;
      successRecordButton.style.display = '';
      successRecordTextArea.style.display = 'none';
      successUpdateCancelButton.style.display = 'none';
      successRecordError.style.display = 'none';
    })
    .catch(error => {
      console.log(error.message)
      const successRecordError = document.getElementById('js-success-record-post-error');
      successRecordError.style.display = '';
    })
  })
})
