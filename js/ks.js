// Generated by CoffeeScript 1.4.0
(function() {
    
    $(function() {
    Navigation.initNavigation();
    Members.initMembers();
    Gallery.initGalleria();
    return this;
  });

  this.Gallery = {};

  (function() {
    this.initGalleria = function() {
      var galleriaConfig, galleriaTheme;
      galleriaConfig = {
        flickr: 'user:kusisukat',
        flickrOptions: {
          max: 500,
          sort: 'date-posted-desc'
        }
      };
      galleriaTheme = 'lib/galleria/themes/classic/galleria.classic.min.js';
      Galleria.loadTheme(galleriaTheme);
      return Galleria.run('.galleria', galleriaConfig);
    };
    return this;
  }).apply(Gallery);

  this.Members = {};

  (function() {
    var createMarkup;
    this.initMembers = function() {
      return createMarkup();
    };
    createMarkup = function() {
      var diveCardTpl, diveCards;
      diveCards = [
        {
          image: 'img/mane.jpg',
          name: 'mane<br />presidentti',
          location: 'siilinjärvi',
          courses: ['CMAS* P1 2006']
        }, {
          image: 'img/mika.jpg',
          name: 'mika<br />kusipääministeri',
          location: 'siilinjärvi',
          courses: ['CMAS* P1 1991', 'CMAS Nx1 2013', 'CMAS** P2 2013', 'CMAS Trimix Gasblender 2014', 'IANTD Cavern Diver 2014', 'IANTD Adv.Rec.Trimix Diver 2014', 'IANTD Mine Diver 2015']
        }, {
          image: 'img/petri.jpg',
          name: 'petri',
          location: 'siilinjärvi',
          courses: ['CMAS* P1 2003', 'CMAS** P2 2004', 'CMAS Nx1 2013', 'IANTD Cavern Diver 2014', 'IANTD Adv.Rec.Trimix Diver 2014', 'IANTD Mine Diver 2015']
        }, {
          image: 'img/tuomas.jpg',
          name: 'tuomas',
          location: 'göttingen, saksa',
          courses: ['CMAS* P1 2006', 'ANDI CSU 2009', 'ANDI TSD 2012', 'CMAS NX**']
        }, {
          image: 'img/jani.jpg',
          name: 'jani',
          location: 'helsinki',
          courses: ['CMAS* P1 2006', 'CMAS** P2 2008', 'CMAS*** P3 2009', 'PADI EANx 2011']
        }, {
          image: 'img/roope.jpg',
          name: 'roope',
          location: 'siilinjärvi',
          courses: ['CMAS* P1 2014']
        }
      ];
      diveCardTpl = '<div class="diveCard">\
        <img src="<%= image %>">\
        <div class="cardText">\
            <ul>\
                <li class="cardTitle"><%= name %></li>\
                <li><%= location %></li>\
                <% _.each(courses, function(course) { %><li><%= course %></li> <% }) %>\
            </ul>\
        </div>\
    </div>';
      return _.each(diveCards, function(diveCard) {
        return $('section.members').append(_.template(diveCardTpl, diveCard));
      });
    };
    return this;
  }).apply(Members);

  this.Navigation = {};

  (function() {
    var calculateNavPosition, createMarkup, fixNavPosition, releaseNavPosition, scrollPositionBelowNav, scrollToId, topOffsetById;
    this.initNavigation = function() {
      createMarkup();
      $(window).scroll(calculateNavPosition);
      return $('nav a').click(function() {
        return scrollToId($(this));
      });
    };
    createMarkup = function() {
      var navElements, navTpl;
      navElements = [
        {
          section: 'header',
          title: 'pintaan',
          link: '#'
        }, {
          section: 'news',
          title: 'uutiset',
          link: '#'
        }, {
          section: 'members',
          title: 'jäsenet',
          link: '#'
        }, {
          section: 'spots',
          title: 'kohteet',
          link: '#'
        }, {
          section: 'gallery',
          title: 'kuvia',
          link: '#'
        }, {
          section: 'forum',
          title: 'foorumi',
          link: 'http://kusisukat.net/Keskustelu/'
        }
      ];
      navTpl = '<ul>\
      <% _.each(elements, function(element) { %><li><a class="<%= element.section %>" href="<%= element.link %>"><%= element.title %></a></li><% }) %>\
    </ul>';
      return $('nav').append(_.template(navTpl, {
        elements: navElements
      }));
    };
    calculateNavPosition = function() {
      if (scrollPositionBelowNav()) {
        return fixNavPosition();
      } else {
        return releaseNavPosition();
      }
    };
    scrollPositionBelowNav = function() {
      return $(window).scrollTop() > $('header').outerHeight();
    };
    fixNavPosition = function() {
      $('nav').addClass('fixed').next().css('margin-top', '100px');
      return $('nav').css('left', $('header').offset().left);
    };
    releaseNavPosition = function() {
      return $('nav').removeClass('fixed').next().css('margin-top', '0');
    };
    scrollToId = function(elem) {
      if (elem.attr('class') === 'header') {
        return $('html, body').animate({
          scrollTop: 0
        }, 'slow');
      } else {
        return $('html, body').animate({
          scrollTop: topOffsetById(elem.attr('class'))
        }, 'slow');
      }
    };
    topOffsetById = function(id) {
      return $("section." + id).offset().top - 98;
    };
    return this;
  }).apply(Navigation);

}).call(this);
