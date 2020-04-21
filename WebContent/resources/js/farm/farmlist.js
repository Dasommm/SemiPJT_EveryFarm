$(document).ready(function () {

    function initialState(){
        if (localStorage.getItem('card') == null) {
            $('.cards-none').show();
        } else {
            $('.selected-card').html(localStorage.getItem('card'));
            $('.cards-none').hide();
        }
    }

    initialState();

    function addToStorage() {
        var content = $('.selected-card').html();
        localStorage.setItem('card' , content);
    }


    function itemCounter() {
        var itemCount = $('.selected-card-container').length;

        $('.basket_counter').text(itemCount);
        $('.total-item-count').text(itemCount + ' товаров на сумму');
    }

    function calcSum() {
        var sum = 0;
        $('.selected-card__price').each(function(){
            sum += parseInt($(this).text().replace(/\s+/g, ''));
        });

        sum = sum + ' р';
        sum = sum.replace(/(\d)(?=(\d\d\d)+([^\d]|$))/g, '$1 ');

        $('.total-price-title').text(sum);


    }

    $('body').on('click','.item-basket', function(addCard){
        addCard.preventDefault();

        $('.cards-none').hide();

        var img = $(this).parents('.shop-list__item').find('img').attr('src');
        var itemType = $(this).parents('.shop-list__item').find('.item-type').text();
        var itemTitle = $(this).parents('.shop-list__item').find('.item-title').text();
        var price = $(this).parents('.shop-list__item').find('.item-actual-price').text();

        if ($(this).find('.checked').hasClass('active'))  {
            $(this).find('.checked').removeClass('active');
            $(this).find('.checked').addClass('passive')
        }else {
            $(this).find('.checked').removeClass('passive');
            $(this).find('.checked').addClass('active')
        }

        $('.selected-card').prepend('<div class="selected-card-container"><img class="selected-card_img" src="'
            + img +'" alt="man"><div class="selected-card__disc">  <a class="selected-card__type" href="#">'
            + itemType +'</a> <h2 class="selected-card__title"> ' + itemTitle +' </h2> </div> <div class="selected-card__price"> '
            + price +' </div> <button class="selected-card__delete-btn"><svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 21 21"><g><g><path fill="#989cb2" d="M4-.002h13a4 4 0 0 1 4 4v12.999a4 4 0 0 1-4 4H4a4 4 0 0 1-4-4v-13A4 4 0 0 1 4-.002zm11.847 8v-1.5h-.614a.877.877 0 0 0-.785-.518h-1.709V5.9c0-.822-.412-1.22-1.26-1.22H9.52c-.847 0-1.259.398-1.259 1.22v.08H6.552a.877.877 0 0 0-.786.519h-.614v1.498h.84v7.957c0 .576.502 1.042 1.12 1.042h6.776c.617 0 1.12-.466 1.12-1.042V7.997zm-6.84 7.125h-.992V8.882h.992zm1.989 0h-.992V8.882h.992zm2.02 0h-1.024V8.882h1.023z"/></g></g></svg></button> </div>');

        itemCounter();

        calcSum();

        addToStorage();
    });

    $('body').on('click','.selected-card__delete-btn', function(deleteCard){
        deleteCard.preventDefault();
        $(this).parent().remove();
        $('.cards-none').show();
        itemCounter();
        calcSum();
        addToStorage();
    });

    $('.basket').hover(function(){
        $('.showed-basket').css({
            'display': 'block',
        });
        $('.overlay').css({
            'display': 'block',
        });
    });

    $('.showed-basket').mouseleave(function(){
        $('.showed-basket').css({
            'display': 'none',

        });
        $('.overlay').css({
            'display': 'none',
        });
    });
    itemCounter();
    calcSum();
});
