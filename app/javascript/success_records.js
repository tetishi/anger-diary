new Vue({
  el: '#app',
  data: {

  },
  methods: {
    successEditButton() {

    }
  }
})

document.addEventListener('turbolinks:load', function () {
  const successEditButton = document.querySelector('.js-success-edit-button')
  if (successEditButton) {
    successEditButton.addEventListener('click', function () {
      const successLabelArea = document.getElementById('js-success-label')
      const twoSuccessButton = document.getElementById('js-two-success-button')
      const successTextArea = document.getElementById('js-success-textarea')
      const successUpdateCancelButton = document.getElementById('js-success-update-cancel-button')

      successLabelArea.style.display = 'none'
      twoSuccessButton.style.display = 'none'
      successTextArea.style.display = ''
      successUpdateCancelButton.style.display = ''
    })
  }

  const successCancelButton = document.getElementById('success-cancel-button')
  if (successCancelButton) {
    successCancelButton.addEventListener('click', function () {
      const successLabelArea = document.getElementById('js-success-label')
      const twoSuccessButton = document.getElementById('js-two-success-button')
      const successTextArea = document.getElementById('js-success-textarea')
      const successUpdateCancelButton = document.getElementById('js-success-update-cancel-button')
      const successRecordError = document.getElementById('js-success-record-post-error')

      successLabelArea.style.display = ''
      twoSuccessButton.style.display = ''
      successTextArea.style.display = 'none'
      successUpdateCancelButton.style.display = 'none'
      successRecordError.style.display = 'none'
    })
  }

  const submitUpdateButton = document.querySelector('.submit-update-button')
  if (submitUpdateButton) {
    submitUpdateButton.addEventListener('click', function () {
      const successId = this.id
      const successRecordDate = document.getElementById('success-record').getAttribute('data-record')
      const textField = document.getElementById(`js-textarea-body-${successRecordDate}`)
      const body = textField.value

      const bodyData = {
        success_body: body
      }

      fetch(`/calendars/${successRecordDate}/success_records/${successId}`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(bodyData)
      })
        .then((response) => response.json())
        .then((data) => {
          const successLabelArea = document.getElementById('js-success-label')
          const twoSuccessButton = document.getElementById('js-two-success-button')
          const successTextArea = document.getElementById('js-success-textarea')
          const successUpdateCancelButton = document.getElementById('js-success-update-cancel-button')
          const successRecordError = document.getElementById('js-success-record-post-error')

          successLabelArea.style.display = ''
          successLabelArea.textContent = data.success_body
          twoSuccessButton.style.display = ''
          successTextArea.style.display = 'none'
          successUpdateCancelButton.style.display = 'none'
          successRecordError.style.display = 'none'
        })
        .catch((error) => {
          console.log(error.message)
          const successRecordError = document.getElementById('js-success-record-post-error')
          successRecordError.style.display = ''
        })
    })
  }
})
