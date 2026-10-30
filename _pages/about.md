---
permalink: /
title: "About Tobi"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

Hi there! Welcome to my academic portfolio. I am <b>Tobias Constien</b> – but you should feel free to just call me Tobi! I am currently a PhD Candidate at the [UCD Babylab](https://www.ucdbabylab.com) in the School of Psychology at the University College Dublin. I’m being supervised by [Dr. Michelle Downes](https://people.ucd.ie/michelle.downes) and [Dr. Brendan Rooney](https://people.ucd.ie/brendan.rooney).

I’m broadly interested in the psychological mechanisms and functions of play, whether it’s in development, therapy, or simply how I can win board games against my wife. In my PhD I am exploring the role of pretend play in toddlers' development of executive functions. In my work in dramatherapy, I'm looking at play from a clinical perspective. Nonetheless, I still usually loose games against my wife.

# What's new

## 📚 Recent publications
These are my most recent, hot off the press, publications. *Do let me know what you think!*
  <ul>
  {% assign pubs = site.publications 
     | where: "category", "manuscripts" 
     | sort: "date" 
     | reverse %}
  {% for post in pubs limit:2 %}
    {% include archive-single-cv.html %}
  {% endfor %}
</ul>

<i><small>Find the full list [here](https://tobicn.github.io/TobiasConstien/publications/).</small></i>
 
## 🎙️ Recent talks
I really like sharing my research at conferences, formal, or informal meetings, or public engagement events. You can find my slides, and accepted abstracts here:
 <ul>
  {% assign talks = site.talks 
     | sort: "date" 
     | reverse %}
  {% for post in talks limit:2 %}
    {% include archive-single-talk-cv.html %}
  {% endfor %}
</ul>

<i><small>Find the full list [here](https://tobicn.github.io/TobiasConstien/talks/).</small></i>

## Current Projects
One of the wonderful things about working in and around academia, is that you always have a number of projects ongoing at the same time. This is a snippet of my to-do list right now:


<details markdown="1">
<summary><b> TEDDY Project</b></summary>

My wonderful, fun [PhD Project](https://www.ucdbabylab.com/teddy-project) on toddlers' play and executive functions. The project includes several studies, including an already published meta-analysis on the relation between pretend play and executive functions in early childhood (Constien et al., [2026](https://tobicn.github.io/TobiasConstien/publication/2026-01-21-head-taller)). Currently, I am working on the second round of my data collection of my longitudinal study, which tracks the development of pretend play and executive functions from two to three years of age.

</details>

<details markdown="1">
<summary><b> From Lads to Dads</b></summary>

A meaningful qualitative study on the experience of becoming a father for the very first time that I developed and conducted out of a shared interest with my colleague and fellow PhD Candidate Donagh Seaver-O'Leary. This study interviewed fourteen first-time fathers in Ireland and analysed their experience of becoming a father for the first time via an interpretative-phenomenological approach. The prepared manuscript is currently under review with *Journal of Child and Family Studies*.

</details>

<details markdown="1">
<summary><b> SCOOT Study</b></summary>

The [SCOOT Study](https://osf.io/a5473/overview) from the UCD Babylab looks at toddlers' sleep, screen-time, and play in Ireland. We just recently published our first [paper](https://tobicn.github.io/TobiasConstien/publication/2026-07-31-not-an-extra) from this project. Another study from this project, which looks at the moderating role of sleep within the relation of toddlers' screen time and executive functions development, is currently under review with Human Behaviour and Emerging Technologies.

</details>

<details markdown="1">
<summary><b> Adults Play Too!</b></summary>

Often forgotten, yet nonetheless true: Adults play too! In this collaborative study with Rinat Feniger-Schaal and Amitai Stern (University of Haifa) we mapped via a [pre-registered systematic review ](https://osf.io/wcdga/overview)extant quantitative measures of adult playfulness. What we found: Everybody is playing a different game. As of now, there's little convergence between prevalent measures of adult playfulness, which means that few studies are actually comparable. Our manuscript has been accepted for publication in the International Journal of Play and is currently in production.

</details>

For more info
======
[Get in touch with me.](mailto:tobias.constien@ucdconnect.ie)

This website is based on the [Academic Pages template](https://github.com/academicpages/academicpages.github.io) and hosted on GitHub pages. You can fork this template right now, and create your own site. I highly recommend!


<style>
  .project {
    border: 1px solid rgba(128,128,128,.3);
    border-left: 4px solid #3b82f6;
    border-radius: 6px;
    margin: 0 0 .8em;
    padding: 0 1em;
    background: rgba(128,128,128,.05);
  }
  .project summary {
    display: flex;
    align-items: center;
    gap: .6em;
    cursor: pointer;
    font-weight: 600;
    padding: .7em 0;
    list-style: none;
  }
  .project summary::-webkit-details-marker { display: none; }
  .project summary::before {
    content: "▸";
    transition: transform .2s;
  }
  .project[open] summary::before { transform: rotate(90deg); }
  .project[open] summary {
    border-bottom: 1px solid rgba(128,128,128,.25);
    margin-bottom: .6em;
  }
  .project .tag {
    margin-left: auto;
    font-size: .7em;
    font-weight: 500;
    padding: .15em .7em;
    border-radius: 999px;
    background: rgba(59,130,246,.15);
    white-space: nowrap;
  }
  .project p { font-size: .95em; }
</style>

## Current Projects

One of the wonderful things about working in and around academia is that you always have a number of projects ongoing at the same time. This is a snippet of my to-do list right now (click a project to read more):

<details class="project" markdown="1">
<summary>TEDDY Project <span class="tag">Data collection</span></summary>

My wonderful, fun [PhD project](https://www.ucdbabylab.com/teddy-project) on toddlers' play and executive functions. The project includes several studies, among them an already published meta-analysis on the relation between pretend play and executive functions in early childhood (Constien et al., [2026](https://tobicn.github.io/TobiasConstien/publication/2026-01-21-head-taller)). Currently, I am working on the second round of data collection for my longitudinal study, which tracks the development of pretend play and executive functions from two to three years of age.

</details>

<details class="project" markdown="1">
<summary>From Lads to Dads <span class="tag">Under review</span></summary>

A meaningful qualitative study on the experience of becoming a father for the very first time, which I developed and conducted out of a shared interest with my colleague and fellow PhD candidate Donagh Seaver-O'Leary. We interviewed fourteen first-time fathers in Ireland and analysed their experiences using an interpretative phenomenological approach. The manuscript is currently under review with *Journal of Child and Family Studies*.

</details>

<details class="project" markdown="1">
<summary>SCOOT Study <span class="tag">First paper published</span></summary>

The [SCOOT Study](https://osf.io/a5473/overview) from the UCD Babylab looks at toddlers' sleep, screen time, and play in Ireland. We recently published our first [paper](https://tobicn.github.io/TobiasConstien/publication/2026-07-31-not-an-extra) from this project. Another study, which looks at the moderating role of sleep in the relation between toddlers' screen time and executive function development, is currently under review with *Human Behaviour and Emerging Technologies*.

</details>

<details class="project" markdown="1">
<summary>Adults Play Too! <span class="tag">In production</span></summary>

Often forgotten, yet nonetheless true: adults play too! In this collaborative study with Rinat Feniger-Schaal and Amitai Stern (University of Haifa), we used a [pre-registered systematic review](https://osf.io/wcdga/overview) to map existing quantitative measures of adult playfulness. What we found: everybody is playing a different game. There is little convergence between prevalent measures of adult playfulness, which means that few studies are actually comparable. Our manuscript has been accepted for publication in the *International Journal of Play* and is currently in production.

</details>
