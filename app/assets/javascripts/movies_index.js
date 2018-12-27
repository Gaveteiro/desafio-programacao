//= require application

function range(start, end) {
    const retval = [];
    for (let i = start; i < end; i++) {
        retval.push(i);
    }
    return retval;
}

function scrollToTop() {
    const c = document.documentElement.scrollTop || document.body.scrollTop;
    if (c > 0) {
        window.requestAnimationFrame(scrollToTop);
        window.scrollTo(0, c - c / 48);
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const Movie = {
        template: '#movie-template',
        props: {
            movie: {
                type: Object,
                required: true
            }
        },
        computed: {
            posterPath() {
                return `http://image.tmdb.org/t/p/w185/${this.movie.poster_path}`;
            },
            backdropPath() {
                return `http://image.tmdb.org/t/p/w185/${this.movie.backdrop_path}`;
            },
            overview() {
                if(this.movie.overview.length > 0) {
                    return this.movie.overview;
                } else {
                    return null;
                }
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
        computed: {
            moviesInCurrPage() {
                return this.movies.slice((this.currPage - 1) * 20, this.currPage * 20);
            },
            currPageRange() {
                if(this.currPage < 6) {
                    return range(1, 10)
                } else if(this.currPage + 4 > this.maxPage) {
                    return range(this.currPage - 4, this.maxPage + 1)
                } else {
                    return range(this.currPage - 4, this.currPage + 5);
                }
            },
            maxPage() {
                if(this.movies) {
                    const remainderPage = (this.movies.length % 20) > 1;
                    let maxPage = Math.floor(this.movies.length / 20);

                    if(remainderPage) {
                        maxPage += 1;
                    }

                    return maxPage;
                }

                return 0;
            }
        },
        methods: {
            goToPage(page) {
                this.currPage = page;

                setTimeout(scrollToTop, 300);
            },
            previousPage() {
                if(this.currPage === 1) {
                    return;
                }

                this.currPage -= 1;

                setTimeout(scrollToTop, 300);
            },
            nextPage() {
                if(this.currPage === this.maxPage) {
                    return;
                }

                this.currPage += 1;

                setTimeout(scrollToTop, 300);
            }
        },
        mounted() {
            axios.get('/movies.json').then((response) => {
                this.movies = response.data;
            });
        },
        data() {
            return {
                movies: null,
                currPage: 1
            }
        }
    });
})
