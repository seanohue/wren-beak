## Beak

A functional programming suite for the Wren scripting language.

#### How to Use

- Add the code to your Wren project, along with the LICENSE file (pls).
- Add this line to the top of your Wren script: `import "beak" for Beak`
- You now have access to all Beak functions. For example:

```
Beak.map([1, 2, 3]) { |x| x + 1 } // returns [2, 3, 4] as a new list.
```

For the time being, check out `tests.wren` in this project's repository for more usage examples.

### Tests

Run tests by running `wren tests.wren`.
Tests are done using [wren-warbler](https://github.com/seanohue/wren-warbler)