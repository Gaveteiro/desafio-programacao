// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//= require 'application'

document.addEventListener('DOMContentLoaded', () => {
    const Movie = {
        template: '#movie-template',
        props: {
            movie: {
                type: Object,
                required: true
            }
        },
        data() {
            return {};
        }
    };

    components = {
        'movie': Movie
    }

    const app = new Vue({
        el: '#app',
        components,
        data() {
            return {
                movies: [
                    { id: 1, title: "Título do filme 1" },
                    { id: 2, title: "Título do filme 2" },
                    { id: 3, title: "Título do filme 3" },
                    { id: 4, title: "Título do filme 4" },
                    { id: 5, title: "Título do filme 5" },
                    { id: 6, title: "Título do filme 6" },
                ]
            }
        },
        mounted() {
            console.log(this.movies);
        }
    });
})
