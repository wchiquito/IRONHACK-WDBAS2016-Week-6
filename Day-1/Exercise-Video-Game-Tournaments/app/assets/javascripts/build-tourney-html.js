function buildTourneyHtml (tournament) {
  return '\
    <li>\
      <a href="/tournaments/' + tournament.id + '">' + tournament.name + '</a>\
      <button class="btn btn-danger" data-hook="tourney-delete" type="submit" name="tournament" data-method="delete" value="'+  tournament.id + '"><span class="glyphicon glyphicon-remove"></span> DELETE</button>\
    </li>\
  '
}
