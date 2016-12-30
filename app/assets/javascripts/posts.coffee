# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $('#multi-select').dropdown({
    allowAdditions: true,
    on: 'hover',
    placeholder: 'Add tags...',
    transition: 'auto',
    useLabels: 'true'
    action: 'activate'
  });


  console.log("in posts.coffee")

#  .dropdown({
#  allowAdditions: true,
#  on: 'hover',
#  placeholder: 'Add tags here',
#  transition: 'auto',
#  useLabels: 'true'