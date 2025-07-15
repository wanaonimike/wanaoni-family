const fs      = require("fs");
const path    = require("path");
const matter  = require("gray-matter");

module.exports = function(eleventyConfig) {
  // 1) Passthrough your static assets
  eleventyConfig.addPassthroughCopy("src/css");
  eleventyConfig.addPassthroughCopy("src/js");
  eleventyConfig.addPassthroughCopy("src/images");

  // 2) After Eleventy finishes building your site...
  eleventyConfig.on("afterBuild", () => {
    const postsDir = path.join(__dirname, "src/posts");
    const files = fs.readdirSync(postsDir).filter(f => f.endsWith(".md"));

    // 3) Build an array of { title, url, content }
    const index = files.map(file => {
      const filePath = path.join(postsDir, file);
      const raw = fs.readFileSync(filePath, "utf8");
      const { data, content } = matter(raw);

      // Derive your URL from the filename, e.g. "2025-07-15-hello.md" → "/blog/hello/"
      const slug = file.replace(/^\d{4}-\d{2}-\d{2}-/, "")
                       .replace(/\.md$/, "");
      return {
        title: data.title,
        url:   `/blog/${slug}/`,
        content
      };
    });

    // 4) Write it to dist/search.json
    const outDir = path.join(__dirname, "dist");
    if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });
    fs.writeFileSync(
      path.join(outDir, "search.json"),
      JSON.stringify(index, null, 2)
    );

    console.log("🔍 search.json created with", index.length, "posts");
  });

  // 5) Tell Eleventy where your folders are
  return {
    dir: {
      input:    "src",
      includes: "includes",
      layouts:  "layouts",
      output:   "dist"
    }
  };
};
