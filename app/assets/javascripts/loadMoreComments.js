$( document ).ready(function() {
  $('.more-comments').click( function() {
    $(this).on('ajax:success', function(event) {
      var jobId = $(this).data("job-id");
      $("#comments_" + jobId).html(event.detail[2].responseText);
      $("#comments-paginator-" + jobId).html("<a id='more-comments' data-job-id=" + jobId + "data-type='html' data-remote='true' href='/jobs/" + jobId + "/comments>show more comments</a>");
    });
  });
});
