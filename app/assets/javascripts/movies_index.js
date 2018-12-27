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
        mounted() {
            axios.get('/movies.json').then((response) => {
                this.movies = response.data;
            })
        },
        data() {
            return {
                movies: null
            }
        }
    });
})
