# we have the following branches
### locally
  backup-before-rebase  # Local backup before you rebased
  master                # Your local master
* test-rebase           # You're currently on this updated branch

### remote
- origin/master — your main branch
- origin/backup-before-rebase — backup pushed to GitHub
- origin/test-rebase — your updated temp branch
- origin/gh-pages —  used for deployment via GitHub Pages

# ABOUT - change in /_pages/about.md
# CV - change in /_data/cv.yml
# add tabs - in /_pages/
# change appearance (font, color, size, etc) within _sass/
# change tab order witnin *.md in /_pages/*.md
# change font size of page title in layouts_/page.liquid by changing h1 to h2 or something else <h1 class="post-title">{{ page.title }}</h1>
# change font size of project titles in _pages/projects.md by changing h2 to h3 or something else <h2 class="category">{{ category }}</h2>
# change font size of year in  _pages/publications.md by changing h2 to h3 or something else   <h2 class="year">{{y}}</h2>
# add table of contents (e.g. to projects.md) by specifying in toc in the frontmaster like this:
        ---
        layout: page
        title: projects
        permalink: /projects/
        description:
        nav: true
        nav_order: 1
        display_categories: [science, other fun]
        horizontal: false
        toc:
          sidebar: left
          min_level: 2
          max_level: 2
        ---
# Add/change buttons in publications in _layouts/bib.liquid
- to display journal abbreviation, abbreviation needs to be entered in the bibText of _bibliograpy/papers.bib
- doi display is suppressed by me in _layouts/bib.liquid
- Data & Code is added by me in  _layouts/bib.liquid and in bibText defined via repo:
- Preprint is added by me in  _layouts/bib.liquid and in bibText defined via preprint:
- year_show = {false} in _bibliograpy/papers.bibcan be used to disable year showing in the citation
- to show google scholar ciations, you need to add your google id (bs9Up3cAAAAJ) in _config.yml and article id (5qfkUJPXOUwC) from its link https://scholar.google.com/citations?view_op=view_citation&hl=en&user=bs9Up3cAAAAJ&citation_for_view=bs9Up3cAAAAJ:5qfkUJPXOUwC

# repos
- enable trophies in _conrig.yml repo_trophies section

# make drop down tab by doing the following (example)
---
layout: page
title: academia
nav: true
nav_order: 6
dropdown: true
children: 
    - title: publications
      permalink: /publications/
    - title: divider
    - title: projects
      permalink: /projects/
    - title: divider
    - title: teaching
      permalink: /teaching/   
---