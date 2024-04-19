<p align="center">
  <img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/ec559a9f6bfd399b82bb44393651661b08aaf7ba/icons/folder-markdown-open.svg" width="100" alt="project-logo">
</p>
<p align="center">
    <h1 align="center">Mediawiki </h1>
</p>
<p align="center">
    <em><code>► assignment project to implement k8s and CI/CD</code></em>
</p>
<p align="center">
        <img src="https://img.shields.io/github/license/abhi8shek/thworks?style=default&logo=opensourceinitiative&logoColor=white&color=0080ff" alt="license">
        <img src="https://img.shields.io/github/last-commit/abhi8shek/thworks?style=default&logo=git&logoColor=white&color=0080ff" alt="last-commit">
        <img src="https://img.shields.io/github/languages/top/abhi8shek/thworks?style=default&color=0080ff" alt="repo-top-language">
        <img src="https://img.shields.io/github/languages/count/abhi8shek/thworks?style=default&color=0080ff" alt="repo-language-count">
<p>
<p align="center">
        <!-- default option, no dependency badges. -->
</p>

<br><!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary><br>

- [ Overview](#-overview)
- [ Features](#-features)
- [ Repository Structure](#-repository-structure)
- [ Project Roadmap](#-project-roadmap)
- [ Contributing](#-contributing)
- [ License](#-license)
- [ Acknowledgments](#-acknowledgments)
</details>
<hr>

##  Overview

<code>MediaWiki serves as a platform for collaborative editing and management of content, enabling users to create, edit, and organize information in a collaborative manner. Its primary purpose is to facilitate the creation and maintenance of wikis, which can range from small team documentation repositories to large-scale knowledge bases like Wikipedia.</code>

---

##  Features

Editing Interface: MediaWiki provides a simple yet powerful editing interface, allowing users to create and edit content using wiki markup or a visual editor.

Page Management: It offers tools for organizing and categorizing pages, including the creation of links, categories, and templates.

User Permissions: MediaWiki supports customizable user permissions and access control, enabling administrators to manage user roles and permissions effectively.

Version Control: All changes to wiki pages are tracked, allowing users to view revision history, compare versions, and revert to previous states if necessary.

Extensions: A wide range of extensions and plugins are available to extend the functionality of MediaWiki, including features like image galleries, advanced formatting, and integration with third-party services.

Localization: MediaWiki supports multiple languages and provides tools for localization and internationalization, making it accessible to users worldwide.

Search Functionality: It offers robust search functionality, including full-text search and advanced search options, to help users find relevant

---

##  Repository Structure

```sh
└── mediawiki/
    ├── .github
    │   └── workflows
    ├── Readme.md
    ├── database-tier
    │   ├── Dockerfile
    │   └── entrypoint.sh
    ├── k8s-helm-scripts
    │   ├── helm-database
    │   └── helm-webserver
    └── web-tier
        ├── Dockerfile
        ├── LocalSettings.php
        └── entrypoint.sh
```


##  Contributing

Contributions are welcome! Here are several ways you can contribute:

- **[Report Issues](https://github.com/abhi8shek/thworks/issues)**: Submit bugs found or log feature requests for the `thworks` project.
- **[Submit Pull Requests](https://github.com/abhi8shek/thworks/blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.
- **[Join the Discussions](https://github.com/abhi8shek/thworks/discussions)**: Share your insights, provide feedback, or ask questions.

<details closed>
<summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your github account.
2. **Clone Locally**: Clone the forked repository to your local machine using a git client.
   ```sh
   git clone https://github.com/abhi8shek/thworks
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to github**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.
8. **Review**: Once your PR is reviewed and approved, it will be merged into the main branch. Congratulations on your contribution!
</details>

<details closed>
<summary>Contributor Graph</summary>
<br>
<p align="center">
   <a href="https://github.com{/abhi8shek/thworks/}graphs/contributors">
      <img src="https://contrib.rocks/image?repo=abhi8shek/thworks">
   </a>
</p>
</details>

---

##  License

This project is protected under the [SELECT-A-LICENSE](https://choosealicense.com/licenses) License. For more details, refer to the [LICENSE](https://choosealicense.com/licenses/) file.

---

##  Acknowledgments

- List any resources, contributors, inspiration, etc. here.

[**Return**](#-overview)

---
