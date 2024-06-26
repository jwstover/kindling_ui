# 🔥 KindlingUI

KindlingUI is a collection of pre-built components backed by the fantastic
<a class="link link-primary" href="https://daisyui.com/">DaisyUI</a>
for use in your Phoenix LiveView projects.

Having built several Phoenix apps from scratch, I often find myself re-implementing (or copying) components
that I had built in a previous project. This component library is an effort to get rid of that wasted time and make
building beautiful Phoenix apps a little easier.

### Why should I use it?

If you've ever wanted a component library for Phoenix that would let you focus less on building UI components, and more on the stuff that makes
your application special then this library is for you. It will give you all of the building blocks that you need
in order to build you app and <i>hopefully</i>
reduce the time it takes to do so. That said, this probably isn't for everyone. I'm building this thing for my personal use
so I'm sure that I will make decisions that suit me that may not suit othes.

The bottom line? I find it useful so maybe you will to.

### Couldn't I just use DaisyUI by itself?

Yep! And I did that for a long time. However, I eventually found myself wanting a bit more so here we are. 🤷‍♂️

KindlingUI provides many extensions / tweaks on top of DaisyUI that make using it a little smoother. 

## Installation

Follow the steps below to get started with KindlingUI.

### Requirements

KindlingUI is meant to be installed in a Phoenix LiveView application using TailwindCSS. It also uses DaisyUI to do a lot of the
heavy lifting, so you'll need that as well.

#### Install DaisyUI

1. The easiest way to install DaisyUI will be to just use your preferred JS package manager. If you don't want to do that you could clone the DaisyUI repo into your vendor folder.

```bashsh
npm i -D daisyui@latest
```

2. Add the DaisyUI plugin to your Tailwind config.

```js
// assets/tailwind.config.js
module.exports = {
  //...
  plugins: [
    require('daisyui'),
    //...
  ],
}
```

#### Add KindlingUI to your project

<p>1. KindlingUI isn't available on Hex yet, so you'll have to install it from github.</p>

<.code_block line_numbers>
<:code># mix.exs</:code>
<:code></:code>
<:code>def deps do</:code>
<:code>[</:code>
<:code highlight>{:kindling_ui, github: "jwstover/kindling_ui"}</:code>
<:code>]</:code>
<:code>end</:code>
</.code_block>

<p>2. Inclide KindlingUI's css in your app.css</p>

<.code_block line_numbers>
<:code># assets/css/app.css</:code>
<:code></:code>
<:code>@import "tailwindcss/base";</:code>
<:code>@import "tailwindcss/components";</:code>
<:code>@import "tailwindcss/utilities";</:code>
<:code></:code>
<:code highlight>@import "../../deps/kindling_ui/assets/css/app.css";</:code>
</.code_block>

<.h2>Next Steps</.h2>

<p>
That's it! You should have KindlingUI installed and ready for use in your Phoenix app.
Click below to go to the usage guide.
</p>
