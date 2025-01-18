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

  const handleChange = (event) => {
    setText(event.target.value);
  };

  return (
    <div className="mb-4">
      <h2 className="text-center">Editor</h2>
      <textarea
        id="editor"
        value={text}
        onChange={handleChange}
        class="form-control"
        rows="10"
      />

      <RenderMarkdown text={text} />
    </div>
  );
}

function RenderMarkdown({ text }) {
  return (
    <div className="mt-4">
      <h2 className="text-center">Preview</h2>
      <div
        id="preview"
        className="p-3 border rounded bg-light"
        dangerouslySetInnerHTML={{ __html: marked.parse(text) }}
      ></div>
    </div>
  );
}

const App = () => {
  return (
    <div className="container my-4">
      <h1 className="text-center mb-4">Markdown Previewer</h1>
      <Editor />
    </div>
  );
};

createRoot(document.getElementById("root")).render(<App />);
