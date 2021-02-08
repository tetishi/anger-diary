document.addEventListener("DOMContentLoaded", function() {
  // debugger;
  // const successRecordForm = document.getElementById('success-record-form');
  // successRecordForm.style.display = 'none';
  document.querySelectorAll(".edit-button").forEach(function (editButton) {
    editButton.addEventListener("click", function() {
      // const successRecordId = document.getElementById('success-record').getAttribute('data-record');
      const successRecordLabelArea = document.getElementById('success-record-label');
      const successRecordButton = document.getElementById('success-record-button');
      const successRecordForm = document.getElementById('success-record-form');

      // console.log(successRecordId);
      successRecordLabelArea.style.display = 'none';
      successRecordButton.style.display = 'none';
      successRecordForm.style.display = '';
    })
  })

  document.getElementById("cancel-button").addEventListener("click", function() {
    const successRecordLabelArea = document.getElementById('success-record-label');
    const successRecordButton = document.getElementById('success-record-button');
    const successRecordForm = document.getElementById('success-record-form');

    successRecordLabelArea.style.display = '';
    successRecordButton.style.display = '';
    successRecordForm.style.display = 'none';
  })

  document.querySelector(".submit-update-button").addEventListener("click", function() {
    // debugger;
    // const successRecordId = document.getElementById('success-record').getAttribute('data-record');
    const successRecordDate = document.getElementById('success-record').getAttribute('data-record');
    const textField = document.getElementById('textarea-body-' + successRecordDate);
    // const body = textField.textContent;
    const body = textField.value
    console.log(successRecordDate);
    console.log(body);
    // console.log(textField);
    // debugger;

    let bodyData = {
      'success_body': body
    }
    // debugger;
    // fetch(`http://localhost3000/success_records/${successRecordId}`, {
    fetch(`http://localhost:3000/calendars/${successRecordDate}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(bodyData)
    })
    .then(response => response.json())
    .then(data => {
      console.log(data)
      const successRecordLabelArea = document.getElementById('success-record-label');
      const successRecordButton = document.getElementById('success-record-button');
      const successRecordForm = document.getElementById('success-record-form');
      // const successRecordError = document.getElementById('')

      successRecordLabelArea.style.display = '';
      successRecordLabelArea.textContent = data.success_body;
      successRecordButton.style.display = '';
      successRecordForm.style.display = 'none';
    })
    .catch(error => console.log(error.message))
  })
})
