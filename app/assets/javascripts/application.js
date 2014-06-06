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
    // $(".datetimeField").datetimepicker( {
    //     dateFormat: "mm/dd/yy",
    //     timeFormat: "hh:mm tt",
    //     hourGrid: 4,
    //     minuteGrid: 15,
    //     showButtonPanel: true,
    //     changeYear: true,
    //     changeMonth: true,
    //     showMonthAfterYear: true,
    //     addSliderAccess: true,
    //     sliderAccessArgs: {}
    //   });

    $('.datetimeField').mobiscroll().datetime({
        theme: 'ios7',
        display: 'bubble',
        mode: 'mixed',
        animate: 'fade',
        stepMinute: 5,
        showNow: true
    });  

    // $(".dateField").datepicker( {
    //     dateFormat: "mm/dd/yy",
    //     showButtonPanel: true,
    //     changeYear: true,
    //     changeMonth: true,
    //     showMonthAfterYear: true
    //   });

    $("table.tablesorter").tablesorter();

    // /* 
    //   When a user closes the datepicker calendar but then manually
    //   types overtop of the date that was entered, enforce the
    //   date formatting again.  Zero-pad day and month, add century
    // */
    // /*
    //   When a date calendar icon is clicked, show the calendar.
    // */
    $(".calendarIcon").click(function() {
      // Find the date field in the row that contains the button
      dateInput = $(this).closest('.row').find('.dateField, .datetimeField');

      if (dateInput) {
        dateInput.mobiscroll("show");
        // if (dateInput.datepicker('widget').is(':hidden')) {
        //   dateInput.mobiscroll("show");
        // } else {
        //   dateInput.mobiscroll("hide");
        // }
      }

      return false;  //Prevent scroll to top of screen
    });


  if ( $("#effective_at_proxy").length ) {
    $("#effective_at_proxy").on("change", function() { 
      var val = createDate($("#effective_at_proxy").val());
      console.log("eff_at_proxy: "+val);
      var str = $.datepicker.formatDate("yy-m-d",val) + " " + val.getHours() + ":" + val.getMinutes() ;
      $("#datum_effective_at").val(str); 

    });
  } 


  if ($('body.data_new').length) {
     $(".datetimeField").mobiscroll('setDate', (new Date()), true );

  }

  if ($('body.data_edit').length) {
    console.log("body.data_edit datum_eff_at.val: " + $('#datum_effective_at').data('iso8601'));
    date = createDate($('#datum_effective_at').data('iso8601'));
    console.log("body.data_edit date: " + date);
    $(".datetimeField").mobiscroll('setDate', date, true );
    $("#comment_count").html($("#datum_comment").val().length);

  }

  if ($('body.data_new').length || $('body.data_edit').length) {
    // Create dummy select to hold the entire optgroup list of groups / types
    $("select#datum_datumType_id").after('<select id="holding" class="hidden"></select>');
    // Shuffle optgroups around when group is changed
    $("select#groups").on("change", change_groups );

    $("#comment_maxlength").html($("#datum_comment").attr('maxLength'));


    $("#datum_comment").on("keyup", function() {
      $("#comment_count").html($(this).val().length);
    });

  }

  // Probably need a more specific selector - which was this supposed to be for?
  $("select").on("change", function() {
    if ($(this).val() == '') { $(this).addClass('placeholder'); }
    else { $(this).removeClass('placeholder'); }
  });


});

function createDate(str) {
  console.log("createDate: " + str);
  var date = new Date(str)
  return date;  //moment(str).toDate();
}

function change_groups() {
  var selGroups = "select#groups"
  var selHolding = "select#holding"
  var selTypes = "select#datum_datumType_id"

  var val = $(selGroups).val();
  var typeVal = $(selTypes).val();

  if (val == '') { 
    $(selTypes + " optgroup").appendTo(selHolding);
    // now re-sort the option groups & append back to original select
    var groups = $(selHolding).children("optgroup").get()
    groups.sort(function(a,b) {
      var upA = $(a).attr("label");
      var upB = $(b).attr("label");
      return (upA < upB) ? -1 : (upA > upB) ? 1 : 0;
    })
    $.each(groups, function(idx,itm) { $(selTypes).append(itm); });

  }
  else { 
    $(selTypes + " optgroup").not("[label='" + val + "']").appendTo(selHolding); 
    $(selHolding + " optgroup[label='" + val + "']").appendTo(selTypes); 
  }

  $(selTypes).val([]);  // reset selected option to blank
}
