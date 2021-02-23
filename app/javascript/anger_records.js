document.addEventListener('turbolinks:load', function () {
  const angerEditButtons = document.querySelectorAll('.js-anger-edit-button')
  if (angerEditButtons) {
    angerEditButtons.forEach(function (editButton) {
      editButton.addEventListener('click', function () {
        // debugger;
        const angerId = document.getElementById('anger-record').getAttribute('data-record')
        const angerLevel = document.getElementById(`js-anger-level-${angerId}`)
        const angerDate = document.getElementById(`js-anger-date-${angerId}`)
        const angerPlace = document.getElementById(`js-anger-place-${angerId}`)
        const angerBody = document.getElementById(`js-anger-body-${angerId}`)
        const angerChangeable = document.getElementById(`js-anger-changeable-${angerId}`)
        const angerImportant = document.getElementById(`js-anger-important-${angerId}`)
        const twoAngerButton = document.getElementById(`js-two-anger-button-${angerId}`)

        const angerRecordFormLevel = document.getElementById(`anger-record-form-level-${angerId}`)
        const angerRecordFormDate = document.getElementById(`anger-record-form-date-${angerId}`)
        const angerRecordFormPlace = document.getElementById(`anger-record-form-place-${angerId}`)
        const angerRecordFormBody = document.getElementById(`anger-record-form-body-${angerId}`)
        const angerRecordFormChangeable = document.getElementById(`anger-record-form-changeable-${angerId}`)
        const angerRecordFormImportant = document.getElementById(`anger-record-form-important-${angerId}`)

        const angerUpdateCancelButton = document.getElementById(`js-anger-update-cancel-button-${angerId}`)

        console.log(angerId)
        angerLevel.style.display = 'none'
        angerDate.style.display = 'none'
        angerPlace.style.display = 'none'
        angerBody.style.display = 'none'
        angerChangeable.style.display = 'none'
        angerImportant.style.display = 'none'
        twoAngerButton.style.display = 'none'
        angerRecordFormLevel.style.display = ''
        angerRecordFormDate.style.display = ''
        angerRecordFormPlace.style.display = ''
        angerRecordFormBody.style.display = ''
        angerRecordFormChangeable.style.display = ''
        angerRecordFormImportant.style.display = ''

        angerUpdateCancelButton.style.display = ''
      })
    })
  }

  const angerCancelButton = document.getElementById('anger-cancel-button')
  if (angerCancelButton) {
    angerCancelButton.addEventListener('click', function () {
      const angerId = document.getElementById('anger-record').getAttribute('data-record')
      const angerLevel = document.getElementById(`js-anger-level-${angerId}`)
      const angerDate = document.getElementById(`js-anger-date-${angerId}`)
      const angerPlace = document.getElementById(`js-anger-place-${angerId}`)
      const angerBody = document.getElementById(`js-anger-body-${angerId}`)
      const angerChangeable = document.getElementById(`js-anger-changeable-${angerId}`)
      const angerImportant = document.getElementById(`js-anger-important-${angerId}`)
      const twoAngerButton = document.getElementById(`js-two-anger-button-${angerId}`)
      const angerRecordFormLevel = document.getElementById(`anger-record-form-level-${angerId}`)
      const angerRecordFormDate = document.getElementById(`anger-record-form-date-${angerId}`)
      const angerRecordFormPlace = document.getElementById(`anger-record-form-place-${angerId}`)
      const angerRecordFormBody = document.getElementById(`anger-record-form-body-${angerId}`)
      const angerRecordFormChangeable = document.getElementById(`anger-record-form-changeable-${angerId}`)
      const angerRecordFormImportant = document.getElementById(`anger-record-form-important-${angerId}`)
      const angerUpdateCancelButton = document.getElementById(`js-anger-update-cancel-button-${angerId}`)

      const angerPlaceError = document.getElementById('js-anger-place-error')
      const angerBodyError = document.getElementById('js-anger-body-error')

      angerLevel.style.display = ''
      angerDate.style.display = ''
      angerPlace.style.display = ''
      angerBody.style.display = ''
      angerChangeable.style.display = ''
      angerImportant.style.display = ''
      twoAngerButton.style.display = ''
      angerRecordFormLevel.style.display = 'none'
      angerRecordFormDate.style.display = 'none'
      angerRecordFormPlace.style.display = 'none'
      angerRecordFormBody.style.display = 'none'
      angerRecordFormChangeable.style.display = 'none'
      angerRecordFormImportant.style.display = 'none'
      angerUpdateCancelButton.style.display = 'none'

      angerPlaceError.style.display = 'none'
      angerBodyError.style.display = 'none'
    })
  }

  const angerUpdateButton = document.querySelector('.anger-update-button')
  if (angerUpdateButton) {
    angerUpdateButton.addEventListener('click', function () {
      const angerId = document.getElementById('anger-record').getAttribute('data-record')
      const angerDate = document.getElementById('js-anger-update-button').getAttribute('data-record')

      // const level = document.getElementById(`js-level-${angerId}`)
      // const strUser = level.options[level.selectedIndex].text
      const level = document.getElementById('anger_record_level').value
      const gotAngryOn = document.getElementById(`js-got-angry-on-${angerId}`).value
      const gotAngryAt = document.getElementById(`js-got-angry-at-${angerId}`).value
      const place = document.getElementById(`js-place-${angerId}`).value
      const angerBody = document.getElementById(`js-body-${angerId}`).value
      // const changeable = document.getElementById(`anger-record-form-changeable-${angerId}`).value
      const changeable = document.querySelector('input[name="anger_record[changeable]"]:checked').value
      const important = document.querySelector('input[name="anger_record[important]"]:checked').value

      // debugger;
      const bodyData = {
        level,
        got_anger_on: gotAngryOn,
        got_angry_at: gotAngryAt,
        place,
        anger_body: angerBody,
        changeable,
        important
      }

      fetch(`/calendars/${angerDate}/anger_records/${angerId}`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(bodyData)
      })
        .then((response) => response.json())
        .then((data) => {
          console.log(data)
          const angerId = document.getElementById('anger-record').getAttribute('data-record')

          const angerLevel = document.getElementById(`js-anger-level-${angerId}`)
          const angerDate = document.getElementById(`js-anger-date-${angerId}`)
          const gotAngryOn = document.getElementById(`js-anger-got-angry-on-${angerId}`)
          const gotAngryAt = document.getElementById(`js-anger-got-angry-at-${angerId}`)
          const angerPlace = document.getElementById(`js-anger-place-${angerId}`)
          const angerBody = document.getElementById(`js-anger-body-${angerId}`)
          const angerChangeable = document.getElementById(`js-anger-changeable-${angerId}`)
          const angerImportant = document.getElementById(`js-anger-important-${angerId}`)

          const twoAngerButton = document.getElementById(`js-two-anger-button-${angerId}`)

          const angerRecordFormLevel = document.getElementById(`anger-record-form-level-${angerId}`)
          const angerRecordFormDate = document.getElementById(`anger-record-form-date-${angerId}`)
          const angerRecordFormPlace = document.getElementById(`anger-record-form-place-${angerId}`)
          const angerRecordFormBody = document.getElementById(`anger-record-form-body-${angerId}`)
          const angerRecordFormChangeable = document.getElementById(`anger-record-form-changeable-${angerId}`)
          const angerRecordFormImportant = document.getElementById(`anger-record-form-important-${angerId}`)

          const angerUpdateCancelButton = document.getElementById(`js-anger-update-cancel-button-${angerId}`)

          const angerPlaceError = document.getElementById('js-anger-place-error')
          const angerBodyError = document.getElementById('js-anger-body-error')

          angerLevel.style.display = ''
          angerLevel.textContent = data.level
          angerDate.style.display = ''
          gotAngryOn.textContent = data.got_angry_on
          gotAngryAt.textContent = new Date(data.got_angry_at).getHours()
          angerPlace.style.display = ''
          angerPlace.textContent = data.place
          angerBody.style.display = ''
          angerBody.textContent = data.anger_body
          angerChangeable.style.display = ''
          angerChangeable.textContent = data.changeable

          // debugger;
          angerImportant.style.display = ''
          angerImportant.textContent = data.important

          twoAngerButton.style.display = ''

          angerRecordFormLevel.style.display = 'none'
          angerRecordFormDate.style.display = 'none'
          angerRecordFormPlace.style.display = 'none'
          angerRecordFormBody.style.display = 'none'
          angerRecordFormChangeable.style.display = 'none'
          angerRecordFormImportant.style.display = 'none'
          angerUpdateCancelButton.style.display = 'none'

          angerPlaceError.style.display = 'none'
          angerBodyError.style.display = 'none'
        })
        .catch((error) => {
          console.log(error.message)
          const angerPlaceError = document.getElementById('js-anger-place-error')
          const angerBodyError = document.getElementById('js-anger-body-error')

          angerPlaceError.style.display = ''
          angerBodyError.style.display = ''
        })
    })
  }
})
