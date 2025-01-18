import React from "https://esm.sh/react";
import ReactDOM from "https://esm.sh/react-dom";
import { createRoot } from "https://esm.sh/react-dom/client";

marked.use({ breaks: true });

const initialText = `# Markdown Previewer

## It allows subheadings

\`inline code\`

\`\`\`
const code = "Block";
\`\`\`

- lists
- *italicized elements*
- [links](https://www.freecodecamp.org)

> block quote

**images and bold text**
![images](https://cdn.freecodecamp.org/testable-projects-fcc/images/fcc_secondary.svg)
`;

function Editor() {
  const [text, setText] = React.useState(initialText);

  const handleChange = event => {
    setText(event.target.value);
  };

  return /*#__PURE__*/(
    React.createElement("div", { className: "mb-4" }, /*#__PURE__*/
    React.createElement("h2", { className: "text-center" }, "Editor"), /*#__PURE__*/
    React.createElement("textarea", {
      id: "editor",
      value: text,
      onChange: handleChange,
      class: "form-control",
      rows: "10" }), /*#__PURE__*/


    React.createElement(RenderMarkdown, { text: text })));


}

function RenderMarkdown({ text }) {
  return /*#__PURE__*/(
    React.createElement("div", { className: "mt-4" }, /*#__PURE__*/
    React.createElement("h2", { className: "text-center" }, "Preview"), /*#__PURE__*/
    React.createElement("div", {
      id: "preview",
      className: "p-3 border rounded bg-light",
      dangerouslySetInnerHTML: { __html: marked.parse(text) } })));



}

const App = () => {
  return /*#__PURE__*/(
    React.createElement("div", { className: "container my-4" }, /*#__PURE__*/
    React.createElement("h1", { className: "text-center mb-4" }, "Markdown Previewer"), /*#__PURE__*/
    React.createElement(Editor, null)));


};

createRoot(document.getElementById("root")).render( /*#__PURE__*/React.createElement(App, null));