# Everything you always wanted to know about URL redirection (but were afraid to ask)

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

## How does it work?
The secret sauce are two plain text files:
  * `build/_redirects` based on this [documentation](https://developers.cloudflare.com/pages/platform/redirects)
  * `build/_headers` based on this [documentation](https://developers.cloudflare.com/pages/platform/headers/)

Make sure to put all the items with placeholders or splats at the end of the `build/_redirects`.

```bash
/mail https://outlook.office.com/ 301
/github https://github.com/bhdicaire/ 301
/github/* https://github.com/bhdicaire/:splat
```

> Pages uses HTTP validation and needs to hit an HTTP endpoint during validation. If another Cloudflare product is in the way (such as Access, a redirect, a Worker, etc.), validation cannot be completed.

### HTTPS Headers

I'm using the `build/_headers` to include the following items to Cloudflare Pages responses, don't forget to change the URLs for pages.dev and your custom domain:
```html
https://xyz.pages.dev/*
  X-Robots-Tag: noindex
  X-Content-Type-Options: nosniff

https://example.com/*
  X-Robots-Tag: noindex
  X-Content-Type-Options: nosniff
```
