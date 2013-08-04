@Members = {}
(->
  @initMembers = ->
    createMarkup()

  createMarkup = ->
    diveCards = [
      { image: 'img/mane.jpg', name: 'mane<br />presidentti', location: 'siilinjärvi', courses: ['CMAS* P1 2006'] }
      { image: 'img/mika.jpg', name: 'mika', location: 'siilinjärvi', courses: ['CMAS* P1 1991'] }
      { image: 'img/petri.jpg', name: 'petri', location: 'siilinjärvi', courses: ['CMAS** P2 2003'] }
      { image: 'img/tuomas.jpg', name: 'tuomas', location: 'saksa', courses: ['CMAS* P1 2006', 'ANDI CSU 2009', 'ANDI TSD 2012', 'CMAS NX**'] }
      { image: 'img/jani.jpg', name: 'jani', location: 'helsinki', courses: ['CMAS*** P3 2009', 'CMAS Nx1 2011'] }
      { image: 'img/niko.jpg', name: 'niko', location: 'helsinki', courses: ['CMAS** P2 2011', 'CMAS Nx1 2011'] }
    ]

    diveCardTpl = '<div class="diveCard">
        <img src="<%= image %>">
        <div class="cardText">
            <ul>
                <li class="cardTitle"><%= name %></li>
                <li><%= location %></li>
                <% _.each(courses, function(course) { %><li><%= course %></li> <% }) %>
            </ul>
        </div>
    </div>'

    _.each(diveCards, (diveCard) -> $('section.members').append(_.template(diveCardTpl, diveCard)))

  return this
).apply(Members)
