document.addEventListener("DOMContentLoaded", function() {
  // debugger;
  // const successRecordForm = document.getElementById('success-record-form');
  // successRecordForm.style.display = 'none';
  document.querySelectorAll(".edit-button").forEach(function (editButton) {
    editButton.addEventListener("click", function() {
      const successRecordId = document.getElementById('success-record').getAttribute('data-record');
      const successRecordLabelArea = document.getElementById('success-record-label');
      const successRecordButton = document.getElementById('success-record-button');
      const successRecordForm = document.getElementById('success-record-form');

      console.log(successRecordId);
      successRecordLabelArea.style.display = 'none';
      successRecordButton.style.display = 'none';
      successRecordForm.style.display = '';

      // debugger;
      // fetch(`http://localhost3000/anger_records/${this.id}/edit`, {
      //   method: "PATCH",
      //   headers: {
      //     "Content-Type": "application/json"
      //   },
      //   body: JSON.stringify()
      // })
      // .then(response => {
      //   return response.json()
      // })
      // .then(data =>
      //   console.log(data)
      // );
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
})
