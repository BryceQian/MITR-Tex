# 模板维护约定

- 本目录是面向同学使用的空白模板，入口为 `main.tex`，排版类为 `milpaper.cls`。
- 使用 XeLaTeX；中文采用 Fandol，西文采用 TeX Gyre Termes，均由 TeX Live 提供。
- 保留原有页面边距、字号、缩进、标题、摘要和参考文献层级；修改排版后编译并检查 PDF。
- 构建文件放入 `build/`，交付前清理包含本机路径的日志、SyncTeX 与中间文件。
