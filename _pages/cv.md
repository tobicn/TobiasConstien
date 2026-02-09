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

  <ul>{% for post in site.publications limit:4 %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul>

<ul>
  {% assign pubs = site.publications | sort: "date" | reverse %}
  {% for post in pubs limit:5 %}
    {% include archive-single-cv.html %}
  {% endfor %}
</ul>
 
Recent talks
======
<i><small>Find the full list [here](https://tobicn.github.io/TobiasConstien/talks/).</small></i>

  <ul>{% for post in site.talks  limit:4 reversed %}
    {% include archive-single-talk-cv.html  %}
  {% endfor %}</ul>

Honors and awards
======
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
