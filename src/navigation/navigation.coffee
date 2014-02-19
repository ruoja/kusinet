@Navigation = {}
(->
  @initNavigation = ->
    createMarkup()
    $(window).scroll(calculateNavPosition)
    $('nav a').click(-> scrollToId($(this)))

  createMarkup = ->
    navElements = [
      { section: 'header', title: 'pintaan', link: '#' }
      { section: 'news', title: 'uutiset', link: '#' }
      { section: 'members', title: 'jäsenet', link: '#' }
      { section: 'spots', title: 'kohteet', link: '#' }
      { section: 'gallery', title: 'kuvia', link: '#' }
      { section: 'forum', title: 'foorumi', link: 'http://kusisukat.net/Keskustelu/' }
    ]

    navTpl = '<ul>
      <% _.each(elements, function(element) { %><li><a class="<%= element.section %>" href="<%= element.link %>"><%= element.title %></a></li><% }) %>
    </ul>'

    $('nav').append(_.template(navTpl, { elements: navElements }))

  calculateNavPosition = -> if scrollPositionBelowNav() then fixNavPosition() else releaseNavPosition()

  scrollPositionBelowNav = -> $(window).scrollTop() > $('header').outerHeight()

  fixNavPosition = -> 
    $('nav').addClass('fixed').next().css('margin-top','100px')
    $('nav').css('left', $('header').offset().left)

  releaseNavPosition = -> $('nav').removeClass('fixed').next().css('margin-top','0')

  scrollToId = (elem) -> if elem.attr('class') == 'header' then $('html, body').animate(scrollTop: 0, 'slow') else $('html, body').animate(scrollTop: topOffsetById(elem.attr('class')), 'slow')

  topOffsetById = (id) -> $("section.#{id}").offset().top - 98

  return this
).apply(Navigation)
