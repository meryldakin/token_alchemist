# TokenAlchemist

To use:
1. Paste the body of the params into the `ingredients.json` file.
2. Change the `@oauth_key` and `@oauth_secret` in `token_alchemist` to match those in your app.
3. Start up an interactive shell with `iex -S mix`.
4. Call `TokenAlchemist.transmute()` to generate an oauth token.
5. Use the result in the `Authorization` header as `Bearer <generated token>`
👩‍🔬 🔑 🚪 
