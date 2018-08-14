$(document).ready(function() {
    if($('.home').length > 0) Basket.init();
    BasketCookies.init();
});

var Basket = {
    init: function() {
        this.add();
    },
    add: function() {
        $('.product-box .basic-btn').click(function(e) {
            e.preventDefault();
            var productId = $(this).attr('data-product'),
                quantity = $(this).parent().find('.quantity input[type="number"]').val(),
                product = {};

            if(quantity > 0) {
                product = {
                    id: productId,
                    quantity: quantity
                };
                BasketCookies.read(product, quantity);
            }
        });
    }
};

var BasketCookies = {
    init: function() {
        this.updateCounter();
    },
    add: function(cookie, id, quantity) {
        var currentProducts = JSON.parse(cookie);
        console.log(currentProducts);
        if(quantity > 0) {
            product = {
                id: id,
                quantity: quantity
            };
            console.log(quantity);
            currentProducts.push(product);
            this.create(currentProducts);
        }
    },
    create: function(value) {
        Cookies.set('products', JSON.stringify(value), { expires: 1 });
    },
    read: function(id, quantity) {
        var products = Cookies.get('products');
        if(products) {
            this.add(products, id, quantity);
        } else {
            products = [];
            products.push(id);
            this.create(products);
        }
        this.updateCounter();
    },
    updateCounter: function() {
        var cookie = Cookies.get('products'),
            counter = 0;
        if(cookie) {
            var products = JSON.parse(cookie);
            $.each( products, function( i, e ){
                counter += parseInt(e.quantity);
            });
        }

        $(".basket-icon label").text(counter);
    }
};