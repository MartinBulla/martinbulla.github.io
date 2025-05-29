This document tracks all **custom changes**, **conflict resolutions**, and **manual tweaks** made to this fork of the [al-folio](https://github.com/alshedivat/al-folio) template.

Use it to simplify future updates, rebases, or merges with the upstream repository.

### WORKFLOW

#### Script: Check for upstream changes

**Script:** `scripts/check-upstream-changes.sh`  
**Purpose:** Preview what commits and files have changed upstream before starting a rebase.

**How to use: Run it from your repo root anytime**
```bash
./scripts/check-upstream-changes.sh
```
#### rebase
#### after rebase
run 
`git stash pop`

### Rebase history

- 2025-05-27: Rebasing test-rebase branch onto upstream/master - first time since the web was built
- Next target: ~2025-10 or sooner if upstream adds major features

### Customizations in `_config.yml`

#### Date: 2025-05-27

##### **Reason:** Changed icon for the favicon to `favicon_white.ico`

##### **Reason:** Removed incorrect upstream attribution for photos and replaced with personal credit.

**What was changed:**
- Removed lines:  
  `Photos from <a href="https://unsplash.com" target="_blank">Unsplash</a>.`
  `keywords: jekyll, jekyll-theme, academic-website, portfolio-website  # add your own keywords or leave empty`
- Added lines:
  `Photos by Martin unless indicated otherwise.`
  `keywords: biorhythms, chronobiology, macroecology, shorebirds  # add your own keywords or leave empty`

**Rebase note:**  
Future rebases may reintroduce the Unsplash line. It’s safe to **discard upstream change** and keep this version instead.

##### Reason:** Updated site URL and base path to reflect deployment on GitHub Pages at the root of my personal site. Also enabled display of "last updated" in the footer.

**What was changed:**
- Changed `url` from:
  `https://alshedivat.github.io`  
  to:  
  `https://martinbulla.github.io`
- Cleared `baseurl`:
  from `/al-folio` to an empty string `""` (site is at the root)
- Set `last_updated: true` (was `false`)

**Rebase note:**  
During future rebases, upstream may restore its own `url`, `baseurl`, or `last_updated` values. These changes are **safe to override with the custom values above.**

##### **Reason:** Preserved GitHub and other username, blog and analytics settings.

**What was changed:**
- In user profile section, kept `github_username: MartinBulla`and all other usernames, blog and analytics (Optional Features) settings
- Upstream added additional profile fields (e.g., `acm_id`, `dblp_url`, etc.) — these were retained.

**Rebase note:**  
In future, always keep your usernames, blog, and analytics (Optional Features) setting and review any new fields added upstream.

##### **Reason:** Jekyll Scholar configuration personalized with my name.

**What was changed:**
- Replaced upstream example:
  - `last_name: [Einstein]` → `last_name: Bulla`
  - `first_name: [Albert, A.]` → `first_name: [Martin, M., M]`

**Rebase note:**  
Always keep my `scholar:` block during rebases. Upstream may reintroduce examples (e.g., Einstein); these can be safely discarded.


### Customizations in `_layouts/bib.liquid`
Added preprint and data & code buttons and a possibility to hide year
      {% endif %}
    {% if entry.year and entry.year_show != 'false' %}
      {% capture entryyear %}
        {{ " " }}{{ entry.year }}{% endcapture %}

### Customizations in `_sass/_themes.scss`

#### 2025-05-27  
##### **Reason:** Upstream restructured theming (e.g., `html[data-theme-setting]` blocks). Preserved my color overrides.

**What was changed:**
- Kept upstream structure and variables
- Overrode in dark theme:
  `--global-divider-color: #9797a2; // custom`
- Dropped custom `.fa-sun` / `.fa-moon` icons for theme toggle as upstream introduced a more robust and maintainable theme toggle system using `#light-toggle-*` elements and `data-theme-setting` attributes. My original approach used `.fa-sun` and `.fa-moon` FontAwesome icons with manual visibility control, which is now redundant.

**What was removed:**
```scss
.fa-sun {
  display: none;
}
.fa-moon {
  padding-left: 10px;
  padding-top: 12px;
  display: block;
}
```
**Rebase note:**  
If `_themes.scss` changes again upstream, review and reapply only these overrides manually. Keep upstream structure as-is.

##### **Reason** my version does not support the  use of `sass:color` functions `color.channel`

**What was changed:**
The following
  ```
  --global-back-to-top-bg-color: rgba(
    #{color.channel($black-color, "red", $space: rgb)},
    #{color.channel($black-color, "green", $space: rgb)},
    #{color.channel($black-color, "blue", $space: rgb)},
    0.4
  );
  ```
Was replacced for `--global-back-to-top-bg-color: rgba(0, 0, 0, 0.4);`

The following 
  ```
  --global-back-to-top-bg-color: rgba(
    #{color.channel($white-color, "red", $space: rgb)},
    #{color.channel($white-color, "green", $space: rgb)},
    #{color.channel($white-color, "blue", $space: rgb)},
    0.5
  );
  ```
Was replacced for `--global-back-to-top-bg-color: rgba(255, 255, 255, 0.5);`

### Customizations in `_sass/_variables.scss`

#### 2025-05-27  

##### **Reason:** Override upstream's `$grey-color-dark` with a dynamic lighter value for more balanced dark mode background.

**What was changed:**
- `$grey-color-dark: darken($grey-color, 25%) !default; // custom: lighter dark bg (default: #1c1c1d);`

**Rebase note:**  
Retain upstream structure and syntax. Only override this single value if future upstream changes occur.

##### **Reason:** Replace the upstream 'color.adjust(...)' lines with `lighten(...)`.You’ll stay compatible with Jekyll and avoid extra tooling pain.

### Customizations in `_sass/_base.scss`

#### 2025-05-27  

##### **Reason:** Override upstream's `font-size` in `.navbar-brand.social` from 1.7rem to 1.3rem 


**Rebase note:**  
Retain upstream structure and syntax. Only override this single value if future upstream changes occur.


### Customizations in `_pages/projects.md`

#### Date: 2025-05-27

##### **Reason:** Specified nav_order to 2,   display_categories: [science, fun] 

**Rebase note:**  
Future rebases may reintroduce the upstream definitions. It’s safe to **discard upstream change** and keep this definitions instead.

---


### Policy for unused upstream files

**Date:** 2025-05-27  
**Summary:** To minimize future rebase conflicts and unnecessary tracking, files included by upstream but unused in this fork are kept as-is.

**Examples:** `.all-contributorsrc`, `CONTRIBUTING.md`, etc.

**Policy:**
- Do not delete such files unless they interfere with the build or navigation.
- Leave them unmodified to avoid being re-flagged in future rebases.
- No need to document each one individually unless custom behavior is applied.

---

### Custom variables: 

#### --global-social-icon-color
**Date:** 2025-05-27  
**Definition:**  
```scss
--global-social-icon-color: #b2b7bd;
```

**Used in**
- _sass/_base.scss: `color: var(--global-social-icon-color)`;
- compiled CSS `.navbar.navbar-light .navbar-brand.social a i::before {
  color: var(--global-social-icon-color);
}`

---

### Automation

#### Automated conflict resolution via `.gitattributes`

**Files:**
- `_bibliography/papers.bib`
- `_data/cv.yml`
- `_data/repositories.yml`
- `_pages/about.md`
- `_pages/cv.md` (!!! 2025-05-27 09:49:27 removed `description:` that was placed above  `cv_pdf:` see if it messes up anything !!!)
- `_pages/publications.md` (!!! 2025-05-27 09:49:27 removed `years: [2022]` that was placed below the `description:` see if it messes up anything !!!)
- `_projects/1_project.md`
- `_projects/2_project.md`
- `README.md`


**Reason:** These files contain personal content that should always override upstream versions (example content or placeholder entries).

**Setup:**
- `.gitattributes`:

**Rebase note:**  
These files are auto-resolved in favor of my version during rebase or merge.

**Some upstream files are kept as reference** 
- `_pages/about.md` as `_pages/about_upstream.md`
- `README.md` as `README_upstream.md`
- `_projects/1_project.md` as `_projects/upstream/1_project.md` and the same for 2-6

**Mechanism:** GitHub Action (`.github/workflows/mine_sync-upstream-files-for-backup.yml`)

- Fetches latest upstream `about.md`
- Saves to `_pages/about_upstream.md`
- Commits only if it changes

**Usage:**
- Run automatically weekly
- Or trigger manually after a rebase via GitHub Actions


### deleted during rebase
#### 2025-05-28 10:31:25
- from `_pages/publications.md`
    <!-- _pages/publications.md -->
    <div class="publications">

    {%- for y in page.years %}
      <h2 class="year">{{y}}</h2>
      {% bibliography -f papers -q @*[year={{y}}]* %}
    {% endfor %}

    </div>

#### 2025-05-27
  `_layouts/page.html` contained:
    ---
    layout: default
    ---
    <!-- page.html -->
            <div class="post">

              <header class="post-header">
                <h2 class="post-title">{{ page.title }}</h2>
                <p class="post-description">{{ page.description }}</p>
              </header>

              <article>
                {{ content }}
              </article>

            </div>

  `_layouts/default.html` contained:  
      <!DOCTYPE html>
      <html lang="{{ site.lang }}">

        <!-- Head -->
        <head>
        {%- if page.redirect -%}
          <meta http-equiv="refresh" content="3; url={{ site.baseurl }}/" />
        {%- endif -%}
        {% include head.html %}
        </head>

        <!-- Body -->
        <body class="{% if site.navbar_fixed %}fixed-top-nav{% endif %} {% unless site.footer_fixed %}sticky-bottom-footer{% endunless %}">

          <!-- Header -->
          {%- include header.html %}

          <!-- Content -->
          <div class="container mt-5">
            {{ content }}
          </div>

          <!-- Footer -->
          {%- include footer.html %}

          <!-- JavaScripts -->
          {% include scripts/jquery.html %}
          {% include scripts/bootstrap.html %}
          {% include scripts/masonry.html %}
          {% include scripts/misc.html %}
          {% include scripts/mathjax.html %}
          {% include scripts/analytics.html %}
        </body>
      </html>
  `_layouts/bib.html` contained:  
        ---
---
<!-- _layouts/bib.html -->
      <div class="row">
        <div class="col-sm-2 {% if entry.preview %}preview{% else %}abbr{% endif %}">
        {%- if entry.preview -%}
          {% if entry.preview contains '://' -%}
          <img class="preview z-depth-1 rounded" src="{{ entry.preview }}">
          {%- else -%}
          <img class="preview z-depth-1 rounded" src="{{ entry.preview | prepend: '/assets/img/publication_preview/' | relative_url }}">
          {%- endif -%}
        {%- elsif entry.abbr -%}
          {%- if site.data.venues[entry.abbr] -%}
            {%- assign venue_style = nil -%}
            {%- if site.data.venues[entry.abbr].color != blank -%}
              {%- assign venue_style = site.data.venues[entry.abbr].color | prepend: 'style="background-color:' | append: '"' -%}
            {%- endif -%}
            <abbr class="badge" {% if venue_style %}{{venue_style}}{% endif %}><a href="{{site.data.venues[entry.abbr].url}}">{{entry.abbr}}</a></abbr>
          {%- else -%}
            <abbr class="badge">{{entry.abbr}}</abbr>
          {%- endif -%}
        {%- endif -%}
        </div>

        <!-- Entry bib key -->
        <div id="{{entry.key}}" class="col-sm-8">
        {% if entry.type == "thesis" -%}
          {{reference}}
        {%- else %}
          <!-- Title -->
          <div class="title">{{entry.title}}</div>
          <!-- Author -->
          <div class="author">
          {% assign author_array_size = entry.author_array | size %}

          {% assign author_array_limit = author_array_size %}
          {%- if site.max_author_limit and author_array_size > site.max_author_limit %}
            {% assign author_array_limit = site.max_author_limit %}
          {% endif %}

          {%- for author in entry.author_array limit: author_array_limit -%}
            {%- assign author_is_self = false -%}
            {%- assign author_last_name = author.last | remove: "¶" | remove: "&" | remove: "*" | remove: "†" | remove: "^" -%}
            {%- if author_last_name == site.scholar.last_name -%}
              {%- if site.scholar.first_name contains author.first -%}
                {%- assign author_is_self = true -%}
              {%- endif -%}
            {%- endif -%}
            {%- assign coauthor_url = nil -%}
            {%- if site.data.coauthors[author_last_name] -%}
              {%- for coauthor in site.data.coauthors[author_last_name] -%}
                {%- if coauthor.firstname contains author.first -%}
                  {%- assign coauthor_url = coauthor.url -%}
                  {%- break -%}
                {%- endif -%}
              {%- endfor -%}
            {%- endif -%}
            
            {%- if forloop.length > 1 -%}
              {%- if forloop.first == false -%},&nbsp;{%- endif -%}
              {%- if forloop.last and author_array_limit == author_array_size -%}and&nbsp;{%- endif -%}
            {%- endif -%}
            {%- if author_is_self -%}
              <em>{{author.first}} {{author.last}}</em>
            {%- else -%}
              {%- if coauthor_url -%}
                <a href="{{coauthor_url}}">{{author.first}} {{author.last}}</a>
              {%- else -%}
                {{author.first}} {{author.last}}
              {%- endif -%}
            {%- endif -%}
          {%- endfor -%}
          {%- assign more_authors = author_array_size | minus: author_array_limit -%}
          
          {%- assign more_authors_hide = more_authors | append: " more author" -%}
          {%- if more_authors > 0 -%}
            {%- if more_authors > 1 -%}
              {%- assign more_authors_hide = more_authors_hide | append: "s" -%}
            {%- endif -%}
            {%- assign more_authors_show = '' -%}
            {%- for author in entry.author_array offset: author_array_limit -%}
              {%- assign more_authors_show = more_authors_show | append: author.first | append: " " | append: author.last -%}
              {%- unless forloop.last -%}
                {%- assign more_authors_show = more_authors_show | append: ", " -%}
              {%- endunless -%}
            {%- endfor -%}
            , and
            <span
                class="more-authors"
                title="click to view {{more_authors_hide}}"
                onclick="
                  var element = $(this);
                  element.attr('title', '');
                  var more_authors_text = element.text() == '{{more_authors_hide}}' ? '{{more_authors_show}}' : '{{more_authors_hide}}';
                  var cursorPosition = 0;
                  var textAdder = setInterval(function(){
                    element.text(more_authors_text.substring(0, cursorPosition + 1));
                    if (++cursorPosition == more_authors_text.length){
                      clearInterval(textAdder);
                    }
                }, '{{site.more_authors_animation_delay}}');
                "
            >{{more_authors_hide}}</span>
          {%- endif -%}

          </div>

          <!-- Journal/Book title and date -->
          {% if entry.type == "article" -%}
            {%- capture entrytype -%}<em>{{entry.journal}}</em>{%- endcapture -%}
          {%- elsif ["inproceedings", "incollection"] contains entry.type -%}
            {%- capture entrytype -%}<em>In {{entry.booktitle}}</em> {%- endcapture -%}
          {%- else -%}
            {%- capture entrytype -%}{%- endcapture -%}
          {%- endif -%}
          {%- if entry.month -%}
            {%- capture entrymonth -%}{{ " " }}{{ entry.month | capitalize }}{%- endcapture -%}
          {%- endif -%}
          {%- if entry.year -%}
            {%- capture entryyear -%}{{ " " }}{{entry.year}}{%- endcapture -%}
          {%- endif -%}
          {%- capture periodical -%}{{ entrytype }}{{ entrymonth }}{{ entryyear }}{%- endcapture -%}
          <div class="periodical">
            {{ periodical | strip }}
          </div>
        {%- endif %}
        
          <!-- Links/Buttons -->
          <div class="links">
          {%- if entry.abstract %}
            <a class="abstract btn btn-sm z-depth-0" role="button">Abs</a>
          {%- endif %}
          {%- if entry.arxiv %}
            <a href="http://arxiv.org/abs/{{ entry.arxiv }}" class="btn btn-sm z-depth-0" role="button">arXiv</a>
          {%- endif %}
          {%- if entry.bibtex_show %}
            <a class="bibtex btn btn-sm z-depth-0" role="button">Bib</a>
          {%- endif %}
          {%- if entry.html %}
            <a href="{{ entry.html }}" class="btn btn-sm z-depth-0" role="button">HTML</a>
          {%- endif %}
          {%- if entry.pdf %}
            {% if entry.pdf contains '://' -%}
            <a href="{{ entry.pdf }}" class="btn btn-sm z-depth-0" role="button">PDF</a>
            {%- else -%}
            <a href="{{ entry.pdf | prepend: '/assets/pdf/' | relative_url }}" class="btn btn-sm z-depth-0" role="button">PDF</a>
            {%- endif %}
          {%- endif %}
          {%- if entry.supp %}
            {% if entry.supp contains '://' -%}
            <a href="{{ entry.supp }}" class="btn btn-sm z-depth-0" role="button">Supp</a>
            {%- else -%}
            <a href="{{ entry.supp | prepend: '/assets/pdf/' | relative_url }}" class="btn btn-sm z-depth-0" role="button">Supp</a>
            {%- endif %}
          {%- endif %}
          {%- if entry.blog %}
            <a href="{{ entry.blog }}" class="btn btn-sm z-depth-0" role="button">Blog</a>
          {%- endif %}
          {% if entry.preprint %}
          <a href="{{ entry.preprint }}" class="btn btn-sm z-depth-0" role="button" target="_blank">Preprint</a>
          {% endif %}
          {%- if entry.code %}
            <a href="{{ entry.code }}" class="btn btn-sm z-depth-0" role="button">Code</a>
          {%- endif %}
            {%- if entry.osf %}
            <a href="{{ entry.osf }}" class="btn btn-sm z-depth-0" role="button">Code & Data</a>
            {%- endif %}
          {%- if entry.GitHub %}
          <a href="{{ entry.GitHub }}" class="btn btn-sm z-depth-0" role="button">Code & Data</a>
          {%- endif %}
          {%- if entry.poster %}
            {% if entry.poster contains '://' -%}
            <a href="{{ entry.poster }}" class="btn btn-sm z-depth-0" role="button">Poster</a>
            {%- else -%}
            <a href="{{ entry.poster | prepend: '/assets/pdf/' | relative_url }}" class="btn btn-sm z-depth-0" role="button">Poster</a>
            {%- endif %}
          {%- endif %}
          {%- if entry.slides %}
            {% if entry.slides contains '://' -%}
            <a href="{{ entry.slides }}" class="btn btn-sm z-depth-0" role="button">Slides</a>
            {%- else -%}
            <a href="{{ entry.slides | prepend: '/assets/pdf/' | relative_url }}" class="btn btn-sm z-depth-0" role="button">Slides</a>
            {%- endif %}
          {%- endif %}
          {%- if entry.website %}
            <a href="{{ entry.website }}" class="btn btn-sm z-depth-0" role="button">Website</a>
          {%- endif %}
          </div>

          {% if entry.abstract -%}
          <!-- Hidden abstract block -->
          <div class="abstract hidden">
            <p>{{ entry.abstract }}</p>
          </div>
          {%- endif -%}

          {% if entry.bibtex_show -%}
          <!-- Hidden bibtex block -->
          <div class="bibtex hidden">
            {% highlight bibtex %}{{ entry.bibtex | hideCustomBibtex }}{% endhighlight %}
          </div>
          {%- endif %}
        </div>
      </div>



#### 2025-05-27 16:38:29
  <<<<<<< HEAD
    {% for category in page.display_categories %}
    <a id="{{ category }}" href=".#{{ category }}">
      <h2 class="category">{{ category }}</h2>
    </a>
    {% assign categorized_projects = site.projects | where: "category", category %}
    {% assign sorted_projects = categorized_projects | sort: "importance" %}
  =======
    {%- for category in page.display_categories %}
    <h3 class="category">{{ category }}</h3>
    {%- assign categorized_projects = site.projects | where: "category", category -%}
    {%- assign sorted_projects = categorized_projects | sort: "importance" %}
  >>>>>>> Update projects.md

### CHECK wheter
- to have h3 class instead of h2 in Dispaly categorized projects seciton of projects.md
- use current or upstream Gemfile.lock
- .github/workflows/deploy.yml should be from upstreatm or old - see here
      name: Deploy site

      on:
        push:
          branches:
            - master
            - main
          paths:
            - "assets/**"
            - "**.bib"
            - "**.html"
            - "**.js"
            - "**.liquid"
            - "**/*.md"
            - "**.yml"
            - "Gemfile"
            - "Gemfile.lock"
            - "!.github/workflows/axe.yml"
            - "!.github/workflows/broken-links.yml"
            - "!.github/workflows/deploy-docker-tag.yml"
            - "!.github/workflows/deploy-image.yml"
            - "!.github/workflows/docker-slim.yml"
            - "!.github/workflows/lighthouse-badger.yml"
            - "!.github/workflows/prettier.yml"
            - "!lighthouse_results/**"
            - "!CONTRIBUTING.md"
            - "!CUSTOMIZE.md"
            - "!FAQ.md"
            - "!INSTALL.md"
            - "!README.md"
        pull_request:
          branches:
            - master
            - main
          paths:
            - "assets/**"
            - "**.bib"
            - "**.html"
            - "**.js"
            - "**.liquid"
            - "**/*.md"
            - "**.yml"
            - "Gemfile"
            - "Gemfile.lock"
            - "!.github/workflows/axe.yml"
            - "!.github/workflows/broken-links.yml"
            - "!.github/workflows/deploy-docker-tag.yml"
            - "!.github/workflows/deploy-image.yml"
            - "!.github/workflows/docker-slim.yml"
            - "!.github/workflows/lighthouse-badger.yml"
            - "!.github/workflows/prettier.yml"
            - "!lighthouse_results/**"
            - "!CONTRIBUTING.md"
            - "!CUSTOMIZE.md"
            - "!FAQ.md"
            - "!INSTALL.md"
            - "!README.md"
        workflow_dispatch:

      permissions:
        contents: write

      jobs:
        deploy:
          # available images: https://github.com/actions/runner-images#available-images
          runs-on: ubuntu-latest
          steps:
      <<<<<<< HEAD
            - name: Checkout 🛎️
              uses: actions/checkout@v4
            - name: Setup Ruby
              uses: ruby/setup-ruby@v1
              with:
                ruby-version: "3.2.2"
                bundler-cache: true
            - name: Update _config.yml ⚙️
              uses: fjogeleit/yaml-update-action@main
              with:
                commitChange: false
                valueFile: "_config.yml"
                propertyPath: "giscus.repo"
                value: ${{ github.repository }}
            - name: Install and Build 🔧
              run: |
                pip3 install --upgrade jupyter
                export JEKYLL_ENV=production
                bundle exec jekyll build
            - name: Purge unused CSS 🧹
              run: |
                npm install -g purgecss
                purgecss -c purgecss.config.js
            - name: Deploy 🚀
              if: github.event_name != 'pull_request'
              uses: JamesIves/github-pages-deploy-action@v4
              with:
                folder: _site
      =======
          - name: Checkout code
            uses: actions/checkout@v3
          - name: Setup Ruby
            uses: ruby/setup-ruby@v1
            with:
              ruby-version: '3.2.2'
              bundler-cache: true
          - name: Install deps
            run: |
              npm install -g mermaid.cli
          - name: Setup deploy options
            id: setup
            run: |
              git config --global user.name "GitHub Action"
              git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"
              if [[ ${GITHUB_REF} = refs/pull/*/merge ]]; then # pull request
                echo "::set-output name=SRC_BRANCH::${GITHUB_HEAD_REF}"
                echo "::set-output name=NO_PUSH::--no-push"
              elif [[ ${GITHUB_REF} = refs/heads/* ]]; then # branch, e.g. master, source etc
                echo "::set-output name=SRC_BRANCH::${GITHUB_REF#refs/heads/}"
              fi
              echo "::set-output name=DEPLOY_BRANCH::gh-pages"
          - name: Deploy website 
            run:  yes | bash bin/deploy --verbose ${{ steps.setup.outputs.NO_PUSH }}
                          --src ${{ steps.setup.outputs.SRC_BRANCH }} 
                          --deploy ${{ steps.setup.outputs.DEPLOY_BRANCH }} 
      >>>>>>> Update deploy.yml   change 3.0.2 to 3.2.2 ruby-version: '3.2.2'
