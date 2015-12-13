// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery.infinite-pages
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function () {
	$('.message-item.clickable').click(function (e) {
		var messageItem = $(e.currentTarget);
		var msgId = messageItem.data("id");

		$.ajax({
			type: "POST",
			url: "messages/unread",
			data: JSON.stringify({id: msgId}),
			dataType: 'json',
			success: function (e) {
				messageItem.removeClass("unread");

				var readTime = new Date(e.readTime).toLocaleString();
				messageItem.append('<p class="card-text"><span class="badge">Read at ' + readTime + '</span></p>')
			},
			error: function (e) {
				console.log(e)
			}
		});
	});
});