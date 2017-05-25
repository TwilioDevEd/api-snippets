## How to run
Install dependencies, then execute:
```bash
node app.js <snippetsFolder> <fileNameFilter>
```

`snippetsFolder` is the folder relative to the root of the __api-snippets__ project.
`fileNameFilter` is any part of the filename to use as a filter, usually the extension.

For example, to format all Java snippets under __/twiml__:
```bash
node app.js twiml java
```
