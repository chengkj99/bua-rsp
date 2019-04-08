// https://eslint.org/docs/user-guide/configuring

module.exports = {
  root: true,
  parserOptions: {
    parser: 'babel-eslint'
  },
  env: {
    browser: true,
  },
  extends: [
    // https://github.com/vuejs/eslint-plugin-vue#priority-a-essential-error-prevention
    // consider switching to `plugin:vue/strongly-recommended` or `plugin:vue/recommended` for stricter rules.
    'plugin:vue/essential',
    // https://github.com/standard/standard/blob/master/docs/RULES-en.md
    'standard',
    // "prettier" // eslint-config-prettier 2
    // "plugin:prettier/recommended" // eslint-plugin-prettier eslint-config-prettier 3
  ],
  // required to lint *.vue files
  plugins: [
    "html",
    "standard",
    "promise",
    // "prettier" 1
  ],
  // add your custom rules here
  rules: {
    // allow async-await
    'generator-star-spacing': 'off',
    // allow debugger during development
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    "arrow-parens": ["error", "as-needed"],
    "generator-star-spacing": 0,
    "no-prototype-builtins": 0,
    "no-debugger": 1,
    "valid-jsdoc": 2,
    "space-before-function-paren": ["error", {
      "anonymous": "always",
      "named": "never",
      "asyncArrow": "always"
    }],
    "no-inner-declarations": 0,
    "no-extend-native": 0,
    "quotes": ["error", "single", { "allowTemplateLiterals": true }],
    "array-bracket-spacing": ["error", "never"],
    "object-curly-spacing": ["error", "always"],
    // "prettier/prettier": "error" 1
  },
  "overrides": [{
    "files": ["src/**/*.spec.js", "test/**"],
    "env": {
      "jest": true
    }
  }]
}
