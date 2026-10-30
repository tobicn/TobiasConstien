---
layout: archive
title: "CV"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

Education
======
* <i>Ph.D in Psychology, University College Dublin, 2027 (expected)</i>
* M.Psych Sc., University College Dublin, 2024
* H. Dip. (Psychology), Trinity College Dublin, 2023
* B. A. (Dramatherapy), Nürtingen-Geislingen University, 2021

<style>
  .project {
    border: 1px solid rgba(128,128,128,.3);
    border-left: 4px solid #009E73 ;
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

<details class="project" markdown="1">
<summary><b>Ph.D in Psychology</b>, University College Dublin <span class="tag"><i>expected 2027</i></span></summary>

A three-year PhD program in the UCD Babylab under the supervision of [Assoc. Prof. Michelle Downes](https://people.ucd.ie/michelle.downes) and [Assoc. Prof. Brendan Rooney](https://people.ucd.ie/brendan.rooney) at the School of Psychology at University College Dublin. Funded via the UCD Ad Astra Scholarship. My [research project](https://www.ucdbabylab.com/teddy-project) focuses on pretend play and executive functions during the toddlerhood period.
*I am expecting to submit my thesis during the summer of 2027.*

</details>

<details class="project" markdown="1">
<summary><b>Master of Psychological Science</b>, University College Dublin <span class="tag">2024</span></summary>

A one-year postgraduate program in psychology with a chosen emphasis on developmental and counselling psychology. Research project on research communication in palliative care research under the supervision of Prof. Suzanne Guerin and funded by the European Association for Palliative Care.

* 1<sup>st</sup> Class Honors (3.94/4.00 GPA)

</details>

<details class="project" markdown="1">
<summary><b>Higher Diploma (Psychology)</b>, Trinity College Dublin <span class="tag">2023</span></summary>

A two-year psychology conversion course that grants a pre-professional qualification in psychology. Funded by the German Academic Scholarship Foundation. Final project in the Infant and Child Research Laboratory under the supervision of Prof. Jean Quigley on parental playfulness.

* 1<sup>st</sup> Class Honors (76)

</details>

<details class="project" markdown="1">
<summary><b>Bachelor of Arts (Dramatherapy)</b>, Nürtingen-Geislingen University <span class="tag">2021</span></summary>

Four-year program of drama therapy with an emphasis on psychology, counselling and the performing arts. Funded by the German Academic Scholarship Foundation and the Deutschlandstipendium. Thesis on intersectoral cooperation between the cultural sector and health services (1,0), which was awarded the Young Arts Therapies Research Award.

</details>





Relevant work experience
======
* <b>Teaching Assistant & Occasional Lecturer</b> - since Sept' 2023
  * School of Psychology, University College Dublin
  * Lectures in Intro to Psychology, and Child Development. Seminars and tutorials on statistics and research methods.

* <b>Research Assistant & Occasional Lecturer</b> - 2021-2024
  * Institute for Research and Development in the Arts Therapies, Nürtingen-Geislingen University
  * Research on the literature in the field of dramatherapy. Seminars in research methods in dramatherapy.
  * Supervisor: Johannes Junker

* <b>Research Assistant</b> - Sept' 2023 - Aug' 2024 
  * European Association of Palliative Care
  * Evaluation of research dissemination activities in EU-funded palliative care research projects.
  * Supervisor: Prof. Suzanne Guerin & Dr. Cathy Payne

* <b>Research Assistant</b> - June - Sept' 2023
  * Infant and Child Research Laboratory, Trinity College Dublin
  * Assisted in observational coding of various child and parent behaviors.
  * Supervisor: Dr. Jean Quigley and Dr. Elizabeth Nixon

Latest publications
======
<i><small>Find the full list [here](https://tobicn.github.io/TobiasConstien/publications/).</small></i>

  <ul>
  {% assign pubs = site.publications 
     | where: "category", "manuscripts" 
     | sort: "date" 
     | reverse %}
  {% for post in pubs limit:5 %}
    {% include archive-single-cv.html %}
  {% endfor %}
</ul>
 
Recent talks
======
<i><small>Find the full list [here](https://tobicn.github.io/TobiasConstien/talks/).</small></i>

 <ul>
  {% assign talks = site.talks 
     | sort: "date" 
     | reverse %}
  {% for post in talks limit:5 %}
    {% include archive-single-talk-cv.html %}
  {% endfor %}
</ul>

Honors and awards
======
* <b>Best Talk Award</b>
  * August 2026
  * Lancaster Conference of Infant and Child Development (UK)
* <b>Best Lightening Talk</b>
  * December 2024
  * Children’s Research Network (Ireland)
* <b>Graduates’ Prize in Psychology</b>
  * June 2023
  * Trinity College Dublin
* <b>Young Arts Therapies Research Award</b>
  * October 2021
  * Scientific Association for the Creative Arts Therapies (WFKT)
* <b>Scholarship</b>
  * January 2020
  * German Academic Scholarship Foundation
* <b>Deutschlandstipendium</b>
  * September 2019
  * Nürtingen-Geislingen University 
