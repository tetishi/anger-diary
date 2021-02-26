document.addEventListener('turbolinks:load', function () {
  const angerEditButtons = document.querySelectorAll('.js-anger-edit-button')
  if (angerEditButtons) {
    angerEditButtons.forEach(function (editButton) {
      editButton.addEventListener('click', function () {
        const angerId = this.id

        const angerRecord = document.getElementById(`js-anger-record-${angerId}`)


        // const angerLevel = document.getElementById(`js-anger-level-${angerId}`)
        // const angerDate = document.getElementById(`js-anger-date-${angerId}`)
        // const angerPlace = document.getElementById(`js-anger-place-${angerId}`)
        // const angerBody = document.getElementById(`js-anger-body-${angerId}`)
        // const angerChangeable = document.getElementById(`js-anger-changeable-${angerId}`)
        // const angerImportant = document.getElementById(`js-anger-important-${angerId}`)
        const twoAngerButton = document.getElementById(`js-two-anger-button-${angerId}`)

  
        const angerRecordForm = document.getElementById(`anger-record-form-${angerId}`)

        // const angerRecordFormLevel = document.getElementById(`anger-record-form-level-${angerId}`)
        // const angerRecordFormDate = document.getElementById(`anger-record-form-date-${angerId}`)
        // const angerRecordFormPlace = document.getElementById(`anger-record-form-place-${angerId}`)
        // const angerRecordFormBody = document.getElementById(`anger-record-form-body-${angerId}`)
        // const angerRecordFormChangeable = document.getElementById(`anger-record-form-changeable-${angerId}`)
        // const angerRecordFormImportant = document.getElementById(`anger-record-form-important-${angerId}`)

        // const angerUpdateCancelButton = document.getElementById(`js-anger-update-cancel-button-${angerId}`)


        angerRecord.style.display = 'none'
        // angerLevel.style.display = 'none'
        // angerDate.style.display = 'none'
        // angerPlace.style.display = 'none'
        // angerBody.style.display = 'none'
        // angerChangeable.style.display = 'none'
        // angerImportant.style.display = 'none'
        twoAngerButton.style.display = 'none'


        angerRecordForm.style.display = ''
        // angerRecordFormLevel.style.display = ''
        // angerRecordFormDate.style.display = ''
        // angerRecordFormPlace.style.display = ''
        // angerRecordFormBody.style.display = ''
        // angerRecordFormChangeable.style.display = ''
        // angerRecordFormImportant.style.display = ''

        // angerUpdateCancelButton.style.display = ''



        // const angerId = document.getElementById('anger-record').getAttribute('data-record')
        // const gotAngryOn = document.getElementById(`${angerId}_anger_record_got_angry_on`)
        // if (gotAngryOn && angerId) {
        //   gotAngryOn.addEventListener('change', function () {
        //     const submitButton = document.getElementById('submit-button')
        //     const updateButton = document.getElementById('js-anger-update-button')
      
        //     submitButton.style.display = ''
        //     updateButton.style.display = 'none'
        //   })
        // }
      })
    })
  }

  const angerCancelButton = document.querySelectorAll('.anger-cancel-button')
  if (angerCancelButton) {
    angerCancelButton.forEach(function (cancelButton) {
      cancelButton.addEventListener('click', function () {
        const angerId = this.id

        const angerRecord = document.getElementById(`js-anger-record-${angerId}`)

        // const angerLevel = document.getElementById(`js-anger-level-${angerId}`)
        // const angerDate = document.getElementById(`js-anger-date-${angerId}`)
        // const angerPlace = document.getElementById(`js-anger-place-${angerId}`)
        // const angerBody = document.getElementById(`js-anger-body-${angerId}`)
        // const angerChangeable = document.getElementById(`js-anger-changeable-${angerId}`)
        // const angerImportant = document.getElementById(`js-anger-important-${angerId}`)
        const twoAngerButton = document.getElementById(`js-two-anger-button-${angerId}`)

        const angerRecordForm = document.getElementById(`anger-record-form-${angerId}`)

        // const angerRecordFormLevel = document.getElementById(`anger-record-form-level-${angerId}`)
        // const angerRecordFormDate = document.getElementById(`anger-record-form-date-${angerId}`)
        // const angerRecordFormPlace = document.getElementById(`anger-record-form-place-${angerId}`)
        // const angerRecordFormBody = document.getElementById(`anger-record-form-body-${angerId}`)
        // const angerRecordFormChangeable = document.getElementById(`anger-record-form-changeable-${angerId}`)
        // const angerRecordFormImportant = document.getElementById(`anger-record-form-important-${angerId}`)
        // const angerUpdateCancelButton = document.getElementById(`js-anger-update-cancel-button-${angerId}`)

        const angerPlaceError = document.getElementById('js-anger-place-error')
        const angerBodyError = document.getElementById('js-anger-body-error')

        angerRecord.style.display = ''
        // angerLevel.style.display = ''
        // angerDate.style.display = ''
        // angerPlace.style.display = ''
        // angerBody.style.display = ''
        // angerChangeable.style.display = ''
        // angerImportant.style.display = ''
        twoAngerButton.style.display = ''

        angerRecordForm.style.display = 'none'
        // angerRecordFormLevel.style.display = 'none'
        // angerRecordFormDate.style.display = 'none'
        // angerRecordFormPlace.style.display = 'none'
        // angerRecordFormBody.style.display = 'none'
        // angerRecordFormChangeable.style.display = 'none'
        // angerRecordFormImportant.style.display = 'none'
        // angerUpdateCancelButton.style.display = 'none'

        angerPlaceError.style.display = 'none'
        angerBodyError.style.display = 'none'
      })
    })
  }

  // const angerId = document.getElementById('anger-record').getAttribute('data-record')
  // const gotAngryOn = document.getElementById(`${angerId}_anger_record_got_angry_on`)
  const angerDates = document.querySelectorAll('.anger-date')
  // if (gotAngryOn && angerId) {
  if (angerDates) {
    angerDates.forEach(function (angerDate) {
    // gotAngryOn.forEach(function (angerDate) {
      angerDate.addEventListener('change', function () {
        debugger
        // const angerId = this.id
        const angerId = document.getElementById('anger-record').getAttribute('data-record')
        const submitButton = document.getElementById(`submit-button-${angerId}`)
        const updateButton = document.getElementById('js-anger-update-button')

        // debugger
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
        const angerDate = document.getElementById('js-anger-update-button').getAttribute('data-record')

        const level = document.getElementById(`${angerId}_anger_record_level`).value
        // debugger;
        const gotAngryOn = document.getElementById(`${angerId}_anger_record_got_angry_on`).value
        
        const gotAngryAt = document.getElementById(`${angerId}_anger_record_got_angry_at_4i`).value
        const place = document.getElementById(`${angerId}_anger_record_place`).value
        const angerBody = document.getElementById(`${angerId}_anger_record_anger_body`).value
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
          anger_body: angerBody,
          changeable,
          important
        }


        // if (gotAngryOn !== document.getElementById(`js-anger-got-angry-on-${angerId}`).value) {

        // }
        // debugger
        // fetch(`/calendars/${gotAngryOn}/anger_records/${angerId}`, {
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
            const angerId = this.id

            const angerRecord = document.getElementById(`js-anger-record-${angerId}`)

            const angerLevel = document.getElementById(`js-anger-level-${angerId}`)
            // const angerDate = document.getElementById(`js-anger-date-${angerId}`)
            const gotAngryOn = document.getElementById(`js-anger-got-angry-on-${angerId}`)
            const gotAngryAt = document.getElementById(`js-anger-got-angry-at-${angerId}`)
            const angerPlace = document.getElementById(`js-anger-place-${angerId}`)
            const angerBody = document.getElementById(`js-anger-body-${angerId}`)
            const angerChangeable = document.getElementById(`js-anger-changeable-${angerId}`)
            const angerImportant = document.getElementById(`js-anger-important-${angerId}`)

            const twoAngerButton = document.getElementById(`js-two-anger-button-${angerId}`)


            const angerRecordForm = document.getElementById(`anger-record-form-${angerId}`)

            // const angerRecordFormLevel = document.getElementById(`anger-record-form-level-${angerId}`)
            // const angerRecordFormDate = document.getElementById(`anger-record-form-date-${angerId}`)
            // const angerRecordFormPlace = document.getElementById(`anger-record-form-place-${angerId}`)
            // const angerRecordFormBody = document.getElementById(`anger-record-form-body-${angerId}`)
            // const angerRecordFormChangeable = document.getElementById(`anger-record-form-changeable-${angerId}`)
            // const angerRecordFormImportant = document.getElementById(`anger-record-form-important-${angerId}`)

            // const angerUpdateCancelButton = document.getElementById(`js-anger-update-cancel-button-${angerId}`)

            const angerPlaceError = document.getElementById('js-anger-place-error')
            const angerBodyError = document.getElementById('js-anger-body-error')

            angerRecord.style.display = ''
            // angerLevel.style.display = ''
            angerLevel.textContent = data.level
            // angerDate.style.display = ''
            gotAngryOn.textContent = data.got_angry_on
            gotAngryAt.textContent = new Date(data.got_angry_at).getHours()
            // angerPlace.style.display = ''
            angerPlace.textContent = data.place
            // angerBody.style.display = ''
            angerBody.textContent = data.anger_body
            // angerChangeable.style.display = ''
            angerChangeable.textContent = data.changeable

            // debugger;
            // angerImportant.style.display = ''
            angerImportant.textContent = data.important

            twoAngerButton.style.display = ''

            angerRecordForm.style.display = 'none'
            // angerRecordFormLevel.style.display = 'none'
            // angerRecordFormDate.style.display = 'none'
            // angerRecordFormPlace.style.display = 'none'
            // angerRecordFormBody.style.display = 'none'
            // angerRecordFormChangeable.style.display = 'none'
            // angerRecordFormImportant.style.display = 'none'
            // angerUpdateCancelButton.style.display = 'none'

            angerPlaceError.style.display = 'none'
            angerBodyError.style.display = 'none'

            // debugger;
            // if ()
          })
          .catch((error) => {
            console.log(error.message)
            const angerPlaceError = document.getElementById('js-anger-place-error')
            const angerBodyError = document.getElementById('js-anger-body-error')

            if (place === '') {
              angerPlaceError.style.display = ''
            }
            if (angerBody === '') {
              angerBodyError.style.display = ''
            }
          })
      })
    })
  }
})
