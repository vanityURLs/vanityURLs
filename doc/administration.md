# Administration

You can use the following `Bash scripts`, if this is your cup of tea. Refer to the [documentation](doc/administration.md).

| Name | Description |
| ---- | ----------- |
| `bin/lnk` | Generate a custom ID for a new URL, git add + commit |
| `bin/tinylnk` | Generate a unique ID for a new URL, git add + commit |

1. Generate a specific or a unique ID for a new URL
2. Add the link to the local git repository
3.  Commit the change with an adequate description to the local git repository
4. Push the change to GitHub

Cloudflare will detect the change and initiate a deployment 😄



## Caveat

The code is tested on OS X Ventura and you need only Node.js, if you want to use [ Nano ID](https://github.com/ai/nanoid) to generate URL. You get unique ID in terminal by calling `npx nanoid`, you do not need Nano ID to be installed _anywhere_.
