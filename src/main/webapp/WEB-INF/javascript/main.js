const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const header_item_context = $$(".header-item-context");
const detail_list_items = $(".header-deltail-container");
const detail_item_context = $$(".detail-item--context");
const item_account = $(".header-item-account--container");
const more_managings = $(".more-options-managing");
const more_item_header = $(".header-more-item");
const close_button_more_item = $(".close-button");
const more_managing_context = $$(".more-managing--context")
Array.from(header_item_context).forEach(element => {
    element.addEventListener('focusout', function(){
        if(element.classList.contains("active")){
            element.classList.remove("active");
        }
    })
    element.addEventListener('click', function(event){
        element.classList.add("active");
    })
});


Array.from(more_managing_context).forEach(el =>{
    el.addEventListener('click', e=>{
        if(more_managings.classList.contains("appear")){
            more_managings.classList.remove("appear")
        }
        more_managings.classList.add("disappear");
    })
})
item_account.addEventListener('click', e => {
    if(!detail_list_items.classList.contains("appear")){
        detail_list_items.classList.add("appear");
    }
    else {
        detail_list_items.classList.remove("appear");
    }

});

more_item_header.addEventListener('click',e=>{
    console.log("aaaa")
    if(detail_list_items.classList.contains("appear")){
        detail_list_items.classList.remove("appear");
    }
    if(more_managings.classList.contains("disappear")){
        more_managings.classList.remove("disappear")
    }
    more_managings.classList.add("appear");
});

close_button_more_item.addEventListener('click',e=>{
    if(more_managings.classList.contains("appear")){
        more_managings.classList.remove("appear")
    }
    more_managings.classList.add("disappear");
})


const phongban_menu_container = $$(".phongban-menu--container");
Array.from(phongban_menu_container).forEach(element=>{
    element.addEventListener('click',e =>{
        Array.from(phongban_menu_container).forEach(el=>{
            if(el.classList.contains("selected")){
                el.classList.remove(("selected"));
            }
        })
        element.classList.add("selected");
    })
})