document.addEventListener("DOMContentLoaded", function() {
  document.querySelectorAll(".edit-button").forEach(function (editButton) {
    editButton.addEventListener("click", function() {
      // debugger;
      // const successRecordId = this.dataset('success-record-id');
      const successRecordId = document.getElementById('success-record').getAttribute('data-record');
      // debugger;
      console.log(successRecordId);
      // debugger;
      const successRecordLabelArea = document.getElementById('success-record-label');

      successRecordLabelArea.style.display = 'none';

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
})
