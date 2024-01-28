# Installation

1. Fork the repository, you just need the `main` branch
2. Pushed the forked public repository or create a new private repository on GitHub
  1. git init
  2. git add .
  3. git commit -m "first commit"
  4. git branch -M main
  5. git remote add origin ...
  6. git push -u origin main
3. Create a project underneath Cloudflare Workers & Pages
    *  [Connect the repository](https://developers.cloudflare.com/pages/get-started/guide/#connect-your-git-provider-to-pages)
    * Configure your deployment and build setup:
      * Framework preset: (leave empty)
      * Build command: `cat static.lnk dynamic.lnk > build/_redirects`
      * Build output directory: `/build`
    * Open the _xyz_.page.dev in your browser, you should be redirected to https://BHDicaire.com based on the [current configuration](build/_redirects)
    * Setup a [custom domain](https://developers.cloudflare.com/pages/platform/custom-domains/) for your page project
4. Configure the DNS entry via [Cloudflare DNS](https://dash.cloudflare.com/)
5. Define your configuration in the `vanityURLS.conf` with your preferred text editor or via `make config` if `vi` is your cup of tea
  * SCRIPT_DIR: the path to your local scripts folder included in your path
  * REPO_DIR: the path to your local copy of vanityURLs
  * MY_DOMAIN: your tiny internet domain served by Cloudflare
  * MY_PAGE: your cloudflare's specific page URL
6. Build your initial setup with `make setup`
  * Generate the [header configuration](build/_headers) based on your cloudflare's specific page URL and _tiny_ internet domain name
  * Generate the initial [static.lnk](static.lnk) and [dynamic.lnk](dynamic.lnk)
7. Update the [static](static.lnk) and [dynamic](dynamic.lnk) redirection lists with your preferred text editor and the [`lnk` bash script](script/lnk)
8. Update the main branch of your local git repository and push to GitHub
9. Cloudflare will detect the change and initiate a deployment, please give ~15 seconds for your links to become valid
10. Open the defined fully qualified domain name for your _tiny_ internet domain name in your web browser, and you should be redirected to https://BHDicaire.com based on the [initial configuration](build/_redirects)
11. Update the [header configuration](build/_headers)
    * Change `https://yourrepo.pages.dev/*`  &#8594; to
    * Change `https://yourdomain.com/*`  &#8594; to your
12. Fine tune the [static](static.lnk) and [dynamic](dynamic.lnk) redirection lists with your preferred text editor and the [`lnk` bash script](script/lnk)
13. Add and commit the change to the github repository
