
$(function () {
    $('.mod-chapters').on('click', 'h3, .J-media-item', function(e) {
        var $this = $(this);

        // 如果点击的是章
        if (!$this.hasClass('J-media-item')) {
            var flag = $this.find('span'),
                chapter = $this.parents('.chapter');

            chapter.toggleClass('chapter-active');

            if (chapter.hasClass('chapter-active')) {
                flag.removeClass('js-close').addClass('js-open');
            } else {
                flag.removeClass('js-open').addClass('js-close');
            }
        }
    })
});


