# Customization Notes

This document tracks all **custom changes**, **conflict resolutions**, and **manual tweaks** made to this fork of the [al-folio](https://github.com/alshedivat/al-folio) template.

Use it to simplify future updates, rebases, or merges with the upstream repository.

---

## 📁 Location: `_sass/`, `assets/css/`, and style overrides

### ➤ File: `assets/css/custom.scss`

* **Purpose**: Central location for all SCSS tweaks overriding al-folio defaults.
* ✅ Make sure `@import "custom";` is included at the end of `main.scss`
* Example customization:

  ```scss
  .page-title {
    font-size: 2.2rem;
    color: $blue; // Custom shade for better accessibility
  }
  ```

---

## 🔥 Known Merge Conflict Files (Watch for during upstream rebases)

Use `git diff` to inspect changes here when rebasing.

| File Path               | Description                           | Notes                            |
| ----------------------- | ------------------------------------- | -------------------------------- |
| `_sass/_variables.scss` | May have upstream color/spacing edits | Track local overrides here       |
| `_layouts/default.html` | Custom scripts or meta tags added     | Prefer including via `_includes` |
| `assets/css/main.scss`  | Add `@import "custom"` manually       | Won’t auto-merge cleanly         |

---

## 🧪 Custom Components

### ➤ Feature: Added custom icon to site tab (favicon)

* File: `_config.yml`
* Change:

  ```yaml
  icon: favicon_white.ico
  ```
* File added: `assets/img/favicon_white.ico`

---

## 🔧 Manual Fixes During Rebase

### ⬢ 2025-05-18 Rebase from upstream/master

* Conflict: `_sass/_variables.scss`
* Resolved by keeping local color palette
* Moved upstream's new spacing variables manually into custom.scss for compatibility

Double-check `_includes/head.html` for changed meta tags

## 🔧 Manual Checks After Rebase

### 📦 Plugin Sync After Rebase (Manual Step)

After each rebase:

- [ ] Compare upstream's `Gemfile` and `_config.yml`
  ```bash
  git diff upstream/master..HEAD -- Gemfile _config.yml

**If new plugins are added upstream:**
- Copy the relevant gem lines into your local Gemfile
- Add plugin names to plugins: list in _config.yml (if needed)
- Run bundle install to install them
**If you added a plugin not in upstream, confirm it's still compatible and working ** 

### 🔍 Double-check `_includes/head.html` for changed meta tags

**Why:**  
Upstream may update HTML metadata to improve SEO, social sharing, accessibility, or analytics. If you have made your own edits to `_includes/head.html`, those may conflict or be overwritten during a rebase.

We have custom `<meta>` tags and links in `_includes/head.html`.

**What to look for:**
- `<meta>` tags for:
  - `description`
  - `author`
  - `keywords`
  - `og:*` (Open Graph for social previews)
  -`twitter:*' cards
- `<link>` tags for:
  - favicons (`favicon.ico`, `.svg`, `.png`)
  - Apple touch icons
  - canonical URLs
  - RSS fees
- `<script>` tags for:  
  - analytics (Google Analytics, Panelbear, etc.)
  - verification (e.g., Google/Bing site verification)
  - any asynchronous or deferred loading tweaks

**How to inspect changes:**
- [ ] After each rebase: `git diff upstream/master..HEAD -- _includes/head.html`
What to do when differences are found:
- [ ] If upstream changes are useful or needed (e.g. improved social tags), integrate them manually into your version.
- [ ] Manually re-add any missing customizations (like favicon, analytics).
- [ ] If needed, move custom tags into `_includes/custom-head.html` and `{% include custom-head.html %}` inside head.html — so you don’t need to edit it again and again.

---

## 📌 To-Do for Future Rebases

* [ ] Monitor any new `main.scss` structure changes
* [ ] Migrate Jekyll plugin updates manually if upstream adds new ones (see above)
* [ ] Double-check `_includes/head.html` for changed meta tags (see above)


---

## 📁 Suggestion for Folder Structure

* `doc/notes-customization.md` ← this file
* `assets/css/custom.scss` ← all visual changes
* `README.md` ← keep general project info, not rebase-specific notes

---

*Last updated: 2025-05-19*
