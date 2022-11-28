import { defineConfig } from "vitepress";

export default defineConfig({
  lang: "en-US",
  title: "nexxel • nvim",
  description: "Documentation for nexxel's Neovim configuration",
  cleanUrls: "with-subfolders",
  markdown: {
    theme: "vitesse-dark",
  },
  themeConfig: {
    siteTitle: "nexxel • nvim",
    nav: [
      { text: "Installation", link: "/installation" },
      { text: "Guide", link: "/guide" },
      { text: "Configuration", link: "/configuration" },
    ],
    footer: {
      message: "Released under the MIT license",
    },
  },
});
