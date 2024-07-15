# Administration

You can use the following `Bash scripts` to speed up the creation of URLs

| Name | Description |
| ---- | ----------- |
| `scripts/lnk` | Generate an ID for a new URL, either randomized or customized |

What `scripts/lnk` script does:

1. Generate a specific or a unique ID for a new URL
2. Add the link to the local git repository
3.  Commit the change with an adequate description to the local git repository
4. Push the change to GitHub

Cloudflare will detect the change and initiate a deployment 😄

## Requirements

Note that in order to use the scripts mentioned above, you will need a
`~/.vanityURLs.conf` file on your machine with *your* specific values,
e.g. the path to the repo on your machine, your tiny domain, etc.. A template for this file can
be found [here](../vanityURLs.conf).
