function deleteTournament (event) {
  event.preventDefault();
  var $tournament = $(event.currentTarget);
  if (confirm('Are you sure?')) {
    var $tournamentId = $tournament.val();
    var request = $.ajax({
        url: ['/api/tournaments/', $tournamentId].join(''),
        method: 'DELETE'/*,
        data: $.param({ id: $tournamentId })*/
    });
    request.fail(showError);
    request.done(deleteTourney);
  }

  function showError (error) {
    console.error('Error deleting tournament.', '\n' + error.responseText);
    var $tourneyDeleteSection = $('.js-tourney-delete-section');
    var message = 'Tournament not found.';
    $tourneyDeleteSection.empty();
    $tourneyDeleteSection.append(buildErrorHtml(message));
    $tourneyDeleteSection.show().delay(2500).fadeOut();
  }

  function deleteTourney (tourney) {
    var $tourneyList = $('[data-hook~=tourney-list]');
    var $tourney = $tourneyList.find(['.btn.btn-danger[value=', tourney.id, ']'].join(''));
    $tourney.parent().remove();
  }
}