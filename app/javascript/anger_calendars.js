document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll(".anger-edit-button").forEach(function (editButton) {
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

        const angerRecordFormLevel = document.getElementById('anger-record-form-level-' + angerRecordId);
        const angerRecordFormDate = document.getElementById('anger-record-form-date-' + angerRecordId);
        const angerRecordFormPlace = document.getElementById('anger-record-form-place-' + angerRecordId);
        const angerRecordFormBody = document.getElementById('anger-record-form-body-' + angerRecordId);
        const angerRecordFormChangeable = document.getElementById('anger-record-form-changeable-' + angerRecordId);
        const angerRecordFormImportant = document.getElementById('anger-record-form-important-' + angerRecordId);

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
        
        
        
        // // const successRecordId = document.getElementById('success-record').getAttribute('data-record');
        // const successRecordLabelArea = document.getElementById('success-record-label');
        // const successRecordButton = document.getElementById('success-record-button');
        // const successRecordForm = document.getElementById('success-record-form');
        // // const successRecordError = document.getElementById('js-success-record-post-error');
  
        // successRecordLabelArea.style.display = 'none';
        // successRecordButton.style.display = 'none';
        // successRecordForm.style.display = '';
        // // successRecordError.style.display = 'none';
      })
    })
  
    // document.getElementById("cancel-button").addEventListener("click", function() {
    //   const successRecordLabelArea = document.getElementById('success-record-label');
    //   const successRecordButton = document.getElementById('success-record-button');
    //   const successRecordForm = document.getElementById('success-record-form');
    //   const successRecordError = document.getElementById('js-success-record-post-error');
  
    //   successRecordLabelArea.style.display = '';
    //   successRecordButton.style.display = '';
    //   successRecordForm.style.display = 'none';
    //   successRecordError.style.display = 'none';
    // })
  
    // document.querySelector(".submit-update-button").addEventListener("click", function() {
    //   // debugger;
    //   // const successRecordId = document.getElementById('success-record').getAttribute('data-record');
    //   const successRecordDate = document.getElementById('success-record').getAttribute('data-record');
    // const textField = document.getElementById('textarea-body-' + successRecordDate);
    //   // const body = textField.textContent;
    //   const body = textField.value
    //   console.log(successRecordDate);
    //   console.log(body);
    //   // console.log(textField);
    //   // debugger;
  
    //   let bodyData = {
    //     'success_body': body
    //   }
    //   // debugger;
    //   // fetch(`http://localhost3000/success_records/${successRecordId}`, {
    //   fetch(`http://localhost:3000/calendars/${successRecordDate}`, {
    //     method: "PATCH",
    //     headers: {
    //       "Content-Type": "application/json"
    //     },
    //     body: JSON.stringify(bodyData)
    //   })
    //   .then(response => response.json())
    //   .then(data => {
    //     console.log(data)
    //     const successRecordLabelArea = document.getElementById('success-record-label');
    //     const successRecordButton = document.getElementById('success-record-button');
    //     const successRecordForm = document.getElementById('success-record-form');
    //     const successRecordError = document.getElementById('js-success-record-post-error');
  
    //     successRecordLabelArea.style.display = '';
    //     successRecordLabelArea.textContent = data.success_body;
    //     successRecordButton.style.display = '';
    //     successRecordForm.style.display = 'none';
    //     successRecordError.style.display = 'none';
    //   })
    //   .catch(error => {
    //     console.log(error.message)
    //     const successRecordError = document.getElementById('js-success-record-post-error');
    //     successRecordError.textContent = '出来たことを入力してください'
    //   })
    // })
  })
  