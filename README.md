![logo](doc/logo.png)

vanityURLs is a _simple_ solution to deploy a budget-friendly Url Shortener. It runs at scale in your Cloudflare subscription with continuous integration.

> If you don't own an a Cloudflare subscription already, you can create your free account today so you can experience everything without spending a dime.

Features:
 * Fully branded internet domain using Cloudflare,  [DNS](https://www.cloudflare.com/en-ca/application-services/products/dns/) & [Pages](https://pages.cloudflare.com/) so your links are compact and pretty
 * URL redirection (301, 302, 303, 307 and 308)
 * Advanced redirection with splats (e.g., /news/*  &#8594; /blog/:splat )
 * Continuous integration managed by Cloudflare Page Engine

My objective is to work at the command line and automate it. So feel free to fork, and customize.

## What problem does it solve and why is it useful?

You’ve been there too, a fully branded short URLs is useful but your low volume does not justify a commercial solution. Furthermore, links generated by a free solution will eventually expire and they're not privacy friendly.

This kind of solution is known as TinyURL, tiny url, shorten that long URL, URL Shortening Service,  goo.gl, bit.ly, short.io,

## How does it work?

1. Register a _tiny_ internet domain name with your [preferred vendor](https://www.cloudflare.com/en-ca/products/registrar/)
2. Add the domain to [Cloudflare DNS](https://dash.cloudflare.com/)
3. Store your URLs redirection list in a __private__ GitHub repository
4. Create a project underneath Cloudflare Workers & Pages
    *  [Connect the repository](https://developers.cloudflare.com/pages/get-started/guide/#connect-your-git-provider-to-pages)
    * Configure your deployment and build setup:
      * Framework preset: none
      * Build command: none
      * Build output directory: /cfPage
    * Setup a [custom domain](https://developers.cloudflare.com/pages/platform/custom-domains/) for your page project
5. Configure the DNS entry via [Cloudflare DNS](https://dash.cloudflare.com/)

## How to use?

The code is tested on OS X Ventura and you need only Node.js in the system if you want to use [ Nano ID](https://github.com/ai/nanoid) to generate URL. You get unique ID in terminal by calling `npx nanoid`, you do not need Nano ID to be installed _anywhere_.

You can use `Make`, if this is your cup of tea:
  * url &#8594; Generate a unique ID for a new URL
  * edit  &#8594; Modify the URLs redirection list
  * build  &#8594; GIT add & commit the updated URLs redirection list AND push to github

The secret sauce are two plain text files:
  * `cfPage/_redirects` based on this [documentation](https://developers.cloudflare.com/pages/platform/redirects)
  * `cfPage/_headers` based on this [documentation](https://developers.cloudflare.com/pages/platform/headers/)

### It's bullet proof

As long as you secure your Github and Cloudflare accounts with robust authentication, there is not much that can go wrong with such simple solution. It use the products as designed, there is no hack involved.

> Pages uses HTTP validation and needs to hit an HTTP endpoint during validation. If another Cloudflare product is in the way (such as Access, a redirect, a Worker, etc.), validation cannot be completed.

Make sure to put all the items with placeholders or splats at the end of the `cfPage/_redirects`.

```bash
/mail https://outlook.office.com/ 301
/github https://github.com/bhdicaire/ 301
/github/* https://github.com/bhdicaire/:splat
```

I'm using the `cfPage/_headers` to include the following items to Cloudflare Pages responses, don't forget to change the URLs for pages.dev and your custom domain:
```html
https://xyz.pages.dev/*
  X-Robots-Tag: noindex
  X-Content-Type-Options: nosniff

https://example.com/*
  X-Robots-Tag: noindex
  X-Content-Type-Options: nosniff
```

## Everything you always wanted to know about URL redirection (but were afraid to ask)

HTTP is a [protocol](https://developer.mozilla.org/en-US/docs/Web/HTTP/Resources_and_specifications) for fetching resources such as HTML documents. You can [redirect](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections#Overview) at the service level, within a page or via JavaScript if enabled.

The simplest way to redirect to another URL is to use an [HTML <meta>](https://www.w3docs.com/learn-html/html-meta-tag.html) tag with the http-equiv parameter set to “refresh”. The content attribute sets the delay before the browser redirects the user to the new web page. To redirect immediately, set this parameter to “0” seconds for the content attribute.

```html
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="refresh" content="0; url='https://github.com/bhdicaire'" />
  </head>
  <body>
    <p>You will be redirected to BH Dicaire's Github soon!</p>
  </body>
</html>
```

However HTTP redirects always execute first thus using Cloudflare page `serverless` component is more elegant. I don't need build a static html page per URL either manually or via a static site generator such as [Hugo](https://gohugo.io/).

## Licence
**vanityURLs** is Copyright 2023 Benoît H. Dicaire and [licensed under the MIT licence](https://github.com/bhdicaire/vanityURLs/blob/master/LICENCE).
