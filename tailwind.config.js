const defaultTheme = require('tailwindcss/defaultTheme')

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{liquid,md,html,yml,erb}", "./frontend/javascript/**/*.js", "./data/**/*.yml"],
  theme: {
    extend: {
      textColor: {
        skin: {
          inverted: 'rgb(var(--color-inverted) / <alpha-value>)',
          accented: 'rgb(var(--color-accented) / <alpha-value>)',
          'accented-hover': 'rgb(var(--color-accented-hover) / <alpha-value>)',
          base: 'rgb(var(--color-base) / <alpha-value>)',
          muted: 'rgb(var(--color-muted) / <alpha-value>)',
          dimmed: 'rgb(var(--color-dimmed) / <alpha-value>)',
        }
      },
      fontFamily: {
        sans: ['Source Sans Pro', ...defaultTheme.fontFamily.sans],
        oswald: ['Oswald', ...defaultTheme.fontFamily.sans],
      }
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
  ],
}
