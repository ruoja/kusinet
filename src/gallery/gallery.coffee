@Gallery = {}
(->
  @initGalleria = ->
    galleriaConfig =
      flickr: 'user:kusisukat'
      flickrOptions:
              max:  500
              sort: 'date-posted-desc'

    galleriaTheme = 'lib/galleria/themes/classic/galleria.classic.min.js'

    Galleria.loadTheme galleriaTheme
    Galleria.run '.galleria', galleriaConfig

  return this
).apply(Gallery)
