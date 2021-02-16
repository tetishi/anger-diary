document.addEventListener("turbolinks:load", function() {
  const successEditButton = document.querySelector(".success-edit-button");
  if(successEditButton) {
    successEditButton.addEventListener("click", function() {
      const successRecordLabelArea = document.getElementById('success-record-label');
      const successRecordButton = document.getElementById('success-record-button');
      const successRecordTextArea = document.getElementById('success-record-textarea');
      const successUpdateCancelButton = document.getElementById('success-update-cancel-button');
  
      successRecordLabelArea.style.display = 'none';
      successRecordButton.style.display = 'none';
      successRecordTextArea.style.display = '';
      successUpdateCancelButton.style.display = '';
    })
  }
  
  const cancelButton = document.getElementById("cancel-button");
  if(cancelButton) {
    cancelButton.addEventListener("click", function() {
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
  }
  
  const idSubmitUpdateButton = document.querySelector(".id-submit-update-button");
  if(idSubmitUpdateButton) {
    idSubmitUpdateButton.addEventListener("click", function() {
      const successRecordId = document.getElementById('id-success-record').getAttribute('data-record');
      const textField = document.getElementById('textarea-body-' + successRecordId);
      const body = textField.value
  
      let bodyData = {
        'success_body': body
      }
  
      fetch(`http://localhost:3000/success_records/${successRecordId}`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(bodyData)
      })
      .then(response => response.json())
      .then(data => {
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
  }
  
  const submitUpdateButton = document.querySelector(".submit-update-button");
  if(submitUpdateButton) {
    submitUpdateButton.addEventListener("click", function() {
      const successRecordDate = document.getElementById('success-record').getAttribute('data-record');
      const textField = document.getElementById('textarea-body-' + successRecordDate);
      const body = textField.value
  
      let bodyData = {
        'success_body': body
      }

      fetch(`/calendars/${successRecordDate}`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(bodyData)
      })
      .then(response => response.json())
      .then(data => {
        const successRecordLabelArea = document.getElementById('success-record-label');
        const successRecordButton = document.getElementById('success-record-button');
        const successRecordTextArea = document.getElementById('success-record-textarea');
        const successUpdateCancelButton = document.getElementById('success-update-cancel-button');
        const successRecordError = document.getElementById('js-success-record-post-error');
        const successNotice = document.querySelector('.notice');
  
        successRecordLabelArea.style.display = '';
        successRecordLabelArea.textContent = data.success_body;
        successRecordButton.style.display = '';
        successRecordTextArea.style.display = 'none';
        successUpdateCancelButton.style.display = 'none';
        successRecordError.style.display = 'none';
        successNotice.innerHTML = "<div>出来たことが編集されました。</div>"
      })
      .catch(error => {
        console.log(error.message)
        const successRecordError = document.getElementById('js-success-record-post-error');
        successRecordError.style.display = '';
      })
    })
  }
})
