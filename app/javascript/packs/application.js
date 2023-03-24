// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "bootstrap"
import "../stylesheets/application"

import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

function getList(url) {
    $.get(url).done((resp) => {
        $(".phones table").html(resp);
    })
}

function postCreate(se) {
    se.preventDefault();
    se.stopPropagation();
    const url = $("form").attr("action");
    $.post(url, $("form").serialize()).done((re) => {
        $("form").parent("div").html(re);
        getList(url);
        setup();
    });
}

function getNew(e) {
    e.preventDefault(); 
    $.get($(e.target).attr("href")).done((resp) => { 
        $(e.target).parent().html(resp);
        $("form").on("submit", postCreate)})
}

function delet(e) {
    e.preventDefault();
    e.stopPropagation();
    if (confirm('Are you sure?')) {
        $.ajax({url: $(e.target).attr("href"), method: "delete"}).done((resp) => {
            $(e.target).parents("table").html(resp);
            setup();
        })
    }
    
}

window.setup = function () {
    $("a.new").off("click");
    $("a.delete").off("click");
    $("a.new").on("click", getNew);
    $("a.delete").on("click", delet);
}

$(() => { 
    window.setup();
})

