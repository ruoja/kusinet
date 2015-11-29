@Members = {}
(->
  @initMembers = ->
    createMarkup()

  createMarkup = ->
    diveCards = [
      { image: 'img/mane.jpg', name: 'mane<br />presidentti', location: 'siilinjärvi', courses: ['CMAS* P1 2006'] }
      { image: 'img/mika.jpg', name: 'mika<br />kusipääministeri', location: 'siilinjärvi', courses: ['CMAS* P1 1991', 'CMAS Nx1 2013', 'CMAS** P2 2013', 'CMAS Trimix Gasblender 2014', 'IANTD Cavern Diver 2014', 'IANTD Adv.Rec.Trimix Diver 2014', 'IANTD Mine Diver 2015'] }
      { image: 'img/petri.jpg', name: 'petri', location: 'siilinjärvi', courses: ['CMAS* P1 2003', 'CMAS** P2 2004', 'CMAS Nx1 2013', 'IANTD Cavern Diver 2014', 'IANTD Adv.Rec.Trimix Diver 2014', 'IANTD Mine Diver 2015'] }
      { image: 'img/tuomas.jpg', name: 'tuomas', location: 'göttingen, saksa', courses: ['CMAS* P1 2006', 'ANDI CSU 2009', 'ANDI TSD 2012', 'CMAS NX**'] }
      { image: 'img/jani.jpg', name: 'jani', location: 'helsinki', courses: ['CMAS* P1 2006', 'CMAS** P2 2008', 'CMAS*** P3 2009', 'PADI EANx 2011'] }
      { image: 'img/roope.jpg', name: 'roope', location: 'siilinjärvi', courses: ['CMAS* P1 2014'] }
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
