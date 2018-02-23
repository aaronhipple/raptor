# raptor

RFTA bus notifications on the command line.

Just a toy Haskell project demoing...

- Stack-based project structure
- Command line arguments
- HTTP requests
- XML parsing
- Super basic IO

## development

Use [Stack](https://docs.haskellstack.org/en/stable/README/).

```bash
# run tests and rebuild continuously
stack test --fast --haddock-deps --file-watch

# just make an executable
stack build
stack exec -- raptor-exe 309 BRT

# install in some $PATH-friendly location
stack install
raptor-exe 309 BRT
```

