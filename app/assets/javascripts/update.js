// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(() => {

  /**
   * Add an on-click listener to each update container. The listener
   * switches the view in a container from message to details and back
   */
  $('.updates-feed__container').on('click', (e) => {
    $(e.currentTarget).children('.updates-feed__container__message').toggle()
    $(e.currentTarget).children('.updates-feed__container__details').toggle()
  })
})