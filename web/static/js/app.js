// Utils
function createCookie(name,value,days) {
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days*24*60*60*1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + value + expires + "; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

// import Vue from 'vue';


// VueApp
Vue.component('modal', {
  template: '#modal',
  props: ['showModal'],
  data: function(){
  	return {
  		title: 'Czy posiadasz konto na INSTAGRAM ??',
  		is_hipster: true
  	}
  },
  methods: {
  	redirect_page: function(){
  		this.title = 'Przykro nam, jesteś za mało hipsterski by oglądać tą stronę!';
  		this.is_hipster = false;
  		setTimeout(function(){ location.href = 'https://www.google.pl/'; }, 3000);
  	},
  	hide_modal: function(){
  		createCookie('is_hipster', true, 7);
  		this.$emit('hide');
  	}
  }
});


// import {load, Map, Marker} from 'vue-google-maps';
VueGoogleMap.load({
    'key': 'AIzaSyDEi34lbxa7FtQpuDqmQTDHFEOZfUdf5_g',
})

Vue.component('google-map', VueGoogleMap.Map);
Vue.component('marker', VueGoogleMap.Marker);
  
// load('AIzaSyDEi34lbxa7FtQpuDqmQTDHFEOZfUdf5_g');



// start app
new Vue({
  el: '#app',
  data: {
    showModal: readCookie('is_hipster')? false : true,
    markers: []
  },

  methods: {
  	hideModal: function(){
  		this.showModal = false;
  	}
  }
})