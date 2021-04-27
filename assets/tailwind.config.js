module.exports = {
    purge: [
        '../lib/bitty_web/**/*.ex',
        '../lib/bitty_web/**/*.leex',
        '../lib/bitty_web/**/*.eex',
        './js/**/*.js'
    ],
    darkMode: false, // or 'media' or 'class'
    theme: {
        extend: {},
    },
    variants: {
        extend: {},
    },
    plugins: [
        require('@tailwindcss/forms'),
    ],
}
