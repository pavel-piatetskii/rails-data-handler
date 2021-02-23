// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(() => {
  $('.updates-feed__container').on('click', (e) => {
    $(e.currentTarget).children('.updates-feed__container__message').toggle()
    $(e.currentTarget).children('.updates-feed__container__details').toggle()
  })
})