<div align="center">

# blog.nethuml.xyz

[![Build status](https://img.shields.io/github/actions/workflow/status/NethumL/blog/build.yml?branch=main)](https://github.com/NethumL/blog/actions/workflows/build.yml)

</div>

- This is mostly my personal blog

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->

**Table of Contents**

- [Building](#building)

<!-- markdown-toc end -->

# Building

The exact build process can be seen in the 'Build' GitHub workflow, but the overall idea is:

- Export content in .org to .md using [ox-hugo](https://github.com/kaushalmodi/ox-hugo)
- Build site using [Hugo](https://gohugo.io) and the [LoveIt](https://github.com/dillonzq/LoveIt) theme
- Publish to GitHub Pages
