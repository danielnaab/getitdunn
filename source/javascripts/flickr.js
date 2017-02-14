window.initFlickr = function (user, album, limit) {
    'use strict';

    function Flickr() {
        this.init()
    }

    Flickr.prototype = {
        init: function () {
            window.getPhotos = this.getPhotos
            this.getJSON()
        },
        getJSON: function () {
            //var src = 'http://api.flickr.com/services/feeds/photoset.gne?nsid=' + this.user + '&set=' + this.album + '&format=json&jsoncallback=getPhotos'
            var src = 'http://api.flickr.com/services/feeds/photoset.gne?nsid=' + user + '&set=' + album + '&format=json&jsoncallback=getPhotos'
            var script = document.createElement('script')
                script.src = src
                document.body.appendChild(script)
        },
        getPhotos: function (data) {
            if (data && data.items) {
                var items = data.items
                //var title = data.title
                //var albumTitle = title.replace('Content from ', '')
                //var html = '<h3>' + albumTitle + '</h3>'
                var html = '<div class="images">'

                for (var i = 0; i < items.length; i++) {
                    var item = items[i]
                    if (i <= limit) {
                        html += "<a target=_blank href='" + item.link + "'><img src='" + item.media.m + "' alt=' /></a>"
                    }
                }
                html += '</div>'

                document.querySelector('#flickr').innerHTML = html
            }
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        new Flickr()
    })
}
