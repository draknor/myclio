// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require foundation
//= require_tree .


$(document).ready( function() {
    //Tie in to the Zurb Foundation JavaScript.  Handles things
    //like the user dropdown.
    $(document).foundation();

    // //Make the jQuery datepicker available on any page.
    // $.datetimepicker.setDefaults({
    //     dateFormat: "dd/mm/yy",
    //     timeFormat: "hh:mm",
    //     hourGrid: 4,
    //     minuteGrid: 15,
    //     showButtonPanel: true,
    //     changeYear: true,
    //     changeMonth: true,
    //     showMonthAfterYear: true,

    //     /* 
    //        onClose is triggered when a user picks a date from
    //        the calendar and it closes.  It is also triggered
    //        when a user types in a date while the calendar is
    //        open and then they tab away.  It is NOT called when
    //        the user types in a date while the calendar is not
    //        open and then they tab away.
    //     */
    //     onClose: function(dateText, inst) {
           
    //         Places the focus back on the date field after
    //         the date is selected.  This way a user can tab
    //         to the next field or hit enter to submit the 
    //         form.

    //         Note that this closes the calendar in Chrome
    //         but keeps popping it back open in IE.
          
    //       $(this).focus();

    //     },
    // });

    //Tie any field of class "dateField" to the datepicker.
    $(".datetimeField").datetimepicker( {
        dateFormat: "mm/dd/yy",
        timeFormat: "hh:mm tt",
        hourGrid: 4,
        minuteGrid: 15,
        showButtonPanel: true,
        changeYear: true,
        changeMonth: true,
        showMonthAfterYear: true
      });

    // /* 
    //   When a user closes the datepicker calendar but then manually
    //   types overtop of the date that was entered, enforce the
    //   date formatting again.  Zero-pad day and month, add century
    // */
    // /*
    //   When a date calendar icon is clicked, show the calendar.
    // */
    // $(".calendarIcon").click(function() {
    //   // Find the date field in the row that contains the button
    //   dateInput = $(this).closest('.row').find('.datetimeField');

    //   if (dateInput) {
    //     if (dateInput.datetimepicker('widget').is(':hidden')) {
    //       dateInput.datetimepicker("show");
    //     } else {
    //       dateInput.datetimepicker("hide");
    //     }
    //   }

    //   return false;  //Prevent scroll to top of screen
    // });


  if ($('body.data_new')) {
     $(".datetimeField").datetimepicker('setDate', (new Date()) );
  }

});
