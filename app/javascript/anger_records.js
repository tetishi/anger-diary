document.addEventListener('turbolinks:load', function () {
  const angerEditButtons = document.querySelectorAll('.js-anger-edit-button')
  if (angerEditButtons) {
    angerEditButtons.forEach(function (editButton) {
      editButton.addEventListener('click', function () {
        const angerId = this.id
        const angerRecord = document.getElementById(`js-anger-record-${angerId}`)
        const twoAngerButton = document.getElementById(`js-two-anger-button-${angerId}`)
        const angerRecordForm = document.getElementById(`anger-record-form-${angerId}`)

        angerRecord.style.display = 'none'
        twoAngerButton.style.display = 'none'
        angerRecordForm.style.display = ''
      })
    })
  }

  const angerCancelButton = document.querySelectorAll('.anger-cancel-button')
  if (angerCancelButton) {
    angerCancelButton.forEach(function (cancelButton) {
      cancelButton.addEventListener('click', function () {
        const angerId = this.id
        const angerRecord = document.getElementById(`js-anger-record-${angerId}`)
        const twoAngerButton = document.getElementById(`js-two-anger-button-${angerId}`)
        const angerRecordForm = document.getElementById(`anger-record-form-${angerId}`)
        const placeError = document.getElementById(`js-place-error-${angerId}`)
        const bodyError = document.getElementById(`js-body-error-${angerId}`)

        angerRecord.style.display = ''
        twoAngerButton.style.display = ''
        angerRecordForm.style.display = 'none'
        placeError.style.display = 'none'
        bodyError.style.display = 'none'
      })
    })
  }

  const angerDates = document.querySelectorAll('.anger-date')
  if (angerDates) {
    angerDates.forEach(function (angerDate) {
      angerDate.addEventListener('change', function () {
        const angerId = this.id
        const submitButton = document.getElementById(`js_submit_button_${angerId}`)
        const updateButton = document.getElementById(`js_update_button_${angerId}`)

        submitButton.style.display = ''
        updateButton.style.display = 'none'
      })
    })
  }

  const angerUpdateButton = document.querySelectorAll('.anger-update-button')
  if (angerUpdateButton) {
    angerUpdateButton.forEach(function (updateButton) {
      updateButton.addEventListener('click', function () {
        const angerId = this.id
        const angerDate = document.getElementById('js-anger-button-area').getAttribute('data-record')
        const level = document.getElementById(`${angerId}_anger_record_level`).value
        const gotAngryOn = document.getElementById(`${angerId}_anger_record_got_angry_on`).value
        const gotAngryAt = document.getElementById(`${angerId}_anger_record_got_angry_at_4i`).value
        const place = document.getElementById(`${angerId}_anger_record_place`).value
        const body = document.getElementById(`${angerId}_anger_record_anger_body`).value
        let changeable
        if (document.getElementById(`${angerId}_anger_record_changeable_はい`).checked) {
          changeable = document.getElementById(`${angerId}_anger_record_changeable_はい`).value
        }
        if (document.getElementById(`${angerId}_anger_record_changeable_いいえ`).checked) {
          changeable = document.getElementById(`${angerId}_anger_record_changeable_いいえ`).value
        }
        let important
        if (document.getElementById(`${angerId}_anger_record_important_はい`).checked) {
          important = document.getElementById(`${angerId}_anger_record_important_はい`).value
        }
        if (document.getElementById(`${angerId}_anger_record_important_いいえ`).checked) {
          important = document.getElementById(`${angerId}_anger_record_important_いいえ`).value
        }

        const bodyData = {
          level,
          got_anger_on: gotAngryOn,
          got_angry_at: gotAngryAt,
          place,
          anger_body: body,
          changeable,
          important
        }

        fetch(`/calendars/${angerDate}/anger_records/${angerId}.json`, {
          method: 'PATCH',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(bodyData)
        })
          .then((response) => response.json())
          .then((data) => {
            console.log(data)
            const angerRecord = document.getElementById(`js-anger-record-${angerId}`)
            const angerLevel = document.getElementById(`js-level-${angerId}`)
            const angerGotAngryOn = document.getElementById(`js-got-angry-on-${angerId}`)
            const angerGotAngryAt = document.getElementById(`js-got-angry-at-${angerId}`)
            const angerPlace = document.getElementById(`js-place-${angerId}`)
            const angerBody = document.getElementById(`js-body-${angerId}`)
            const angerChangeable = document.getElementById(`js-changeable-${angerId}`)
            const angerImportant = document.getElementById(`js-important-${angerId}`)
            const twoAngerButton = document.getElementById(`js-two-anger-button-${angerId}`)
            const angerRecordForm = document.getElementById(`anger-record-form-${angerId}`)
            const placeError = document.getElementById(`js-place-error-${angerId}`)
            const bodyError = document.getElementById(`js-body-error-${angerId}`)

            angerRecord.style.display = ''
            angerLevel.textContent = data.level
            angerGotAngryOn.textContent = data.got_angry_on
            angerGotAngryAt.textContent = new Date(data.got_angry_at).getHours()
            angerPlace.textContent = data.place
            angerBody.textContent = data.anger_body
            angerChangeable.textContent = data.changeable
            angerImportant.textContent = data.important
            twoAngerButton.style.display = ''
            angerRecordForm.style.display = 'none'
            placeError.style.display = 'none'
            bodyError.style.display = 'none'
          })
          .catch((error) => {
            console.log(error.message)
            const placeError = document.getElementById(`js-place-error-${angerId}`)
            const bodyError = document.getElementById(`js-body-error-${angerId}`)

            if (place === '') {
              placeError.style.display = ''
            }
            if (body === '') {
              bodyError.style.display = ''
            }
          })
      })
    })
  }
})
