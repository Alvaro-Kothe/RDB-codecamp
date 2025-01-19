import React from "https://esm.sh/react";
import ReactDOM from "https://esm.sh/react-dom";
import { createRoot } from "https://esm.sh/react-dom/client";

function App() {
  return /*#__PURE__*/(
    React.createElement("div", { className: "container mt-5" }, /*#__PURE__*/
    React.createElement("h1", { className: "text-center mb-4" }, "Calculator"), /*#__PURE__*/
    React.createElement(Calculator, null)));


}

createRoot(document.getElementById("root")).render( /*#__PURE__*/React.createElement(App, null));

function Calculator() {
  const [displayValue, setDisplayValue] = React.useState("0");
  const [formula, setFormula] = React.useState([]);
  const [waitingForOperand, setWaitingForOperand] = React.useState(true);
  const [result, setResult] = React.useState(null);

  function handleDigit(digit) {
    if (waitingForOperand) {
      setDisplayValue(digit);
      setWaitingForOperand(false);
    } else {
      if (displayValue === "0" && digit === "0") return;
      setDisplayValue(displayValue === "0" ? digit : displayValue + digit);
    }
  }

  function handleDecimal() {
    if (!displayValue.includes(".")) {
      setDisplayValue(displayValue + ".");
      setWaitingForOperand(false);
    }
  }

  function handleClear() {
    setDisplayValue("0");
    setResult(null);
    setWaitingForOperand(true);
    setFormula([]);
  }

  function handleOperator(nextOperator) {
    const lfv = formula[formula.length - 1];
    const lfvIsOperator = lfv === "-" || lfv === "+" || lfv === "*" || lfv === "/";
    const insertingNegNumber = nextOperator === "-" && waitingForOperand;
    const inputValue = parseFloat(displayValue);
    if (insertingNegNumber) {
      setDisplayValue("-");
      setWaitingForOperand(false);
    } else if (displayValue !== "-" && inputValue !== 0) {
      setFormula([...formula, inputValue, nextOperator]);
      setWaitingForOperand(true);
      setDisplayValue("0");
    } else if (lfvIsOperator) {
      setFormula([...formula.toSpliced(-1), nextOperator]);
      setWaitingForOperand(true);
      setDisplayValue("0");
    }
  }

  function handleEquals() {
    const formulaToCompute = formula.join("") + displayValue;
    setDisplayValue(String(eval(formulaToCompute)));
    setFormula([]);
    setWaitingForOperand(true);
  }

  return /*#__PURE__*/(
    React.createElement("div", { className: "card shadow bg-dark" }, /*#__PURE__*/
    React.createElement("div", { className: "card-body" }, /*#__PURE__*/

    React.createElement("div", { id: "formula", className: "text-muted mb-2" },
    formula.join(" ")), /*#__PURE__*/


    React.createElement("div", { id: "display", className: "form-control text-end mb-3 fs-4" },
    displayValue), /*#__PURE__*/


    React.createElement(CalculatorButtons, {
      onButtonClick: value => {
        if (!isNaN(value)) handleDigit(value);else
        if (value === ".") handleDecimal();else
        if (value === "C") handleClear();else
        if (value === "=") handleEquals();else
        handleOperator(value);
      } }))));




}

function CalculatorButtons({ onButtonClick }) {
  const buttons = [
  { id: "clear", value: "C", className: "btn btn-danger col-6" },
  { id: "divide", value: "/", className: "btn btn-secondary col-3" },
  { id: "multiply", value: "*", className: "btn btn-secondary col-3" },
  { id: "seven", value: "7", className: "btn btn-light col-3" },
  { id: "eight", value: "8", className: "btn btn-light col-3" },
  { id: "nine", value: "9", className: "btn btn-light col-3" },
  { id: "subtract", value: "-", className: "btn btn-secondary col-3" },
  { id: "four", value: "4", className: "btn btn-light col-3" },
  { id: "five", value: "5", className: "btn btn-light col-3" },
  { id: "six", value: "6", className: "btn btn-light col-3" },
  { id: "add", value: "+", className: "btn btn-secondary col-3" },
  { id: "one", value: "1", className: "btn btn-light col-3" },
  { id: "two", value: "2", className: "btn btn-light col-3" },
  { id: "three", value: "3", className: "btn btn-light col-3" },
  { id: "equals", value: "=", className: "btn btn-primary col-3" },
  { id: "zero", value: "0", className: "btn btn-light col-6" },
  { id: "decimal", value: ".", className: "btn btn-light col-3" }];


  const rows = [
  buttons.slice(0, 3), // Row 1: Clear, Divide, Multiply
  buttons.slice(3, 7), // Row 2: 7, 8, 9, Subtract
  buttons.slice(7, 11), // Row 3: 4, 5, 6, Add
  buttons.slice(11, 15), // Row 4: 1, 2, 3, Equals
  buttons.slice(15, 17) // Row 5: 0, Decimal
  ];

  return /*#__PURE__*/(
    React.createElement("div", { className: "container" },
    rows.map((row, rowIndex) => /*#__PURE__*/
    React.createElement("div", { key: rowIndex, className: "row mb-2" },
    row.map(({ id, value, className }) => /*#__PURE__*/
    React.createElement("button", {
      key: id,
      id: id,
      className: className,
      onClick: () => onButtonClick(value) },

    value))))));






}