const quotes = [
{
  quote: "Life isn’t about getting and having, it’s about giving and being.",
  author: "Kevin Kruse" },

{
  quote: "Whatever the mind of man can conceive and believe, it can achieve.",
  author: "Napoleon Hill" },

{
  quote: "Strive not to be a success, but rather to be of value.",
  author: "Albert Einstein" },

{
  quote:
  "Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference.",
  author: "Robert Frost" },

{
  quote: "I attribute my success to this: I never gave or took any excuse.",
  author: "Florence Nightingale" },

{
  quote: "You miss 100% of the shots you don’t take.",
  author: "Wayne Gretzky" }];



function getRandomQuote() {
  const quoteIndex = Math.floor(Math.random() * quotes.length);
  const { quote, author } = quotes[quoteIndex];
  $("#text").text(quote);
  $("#author").text(author);
  $("#tweet-quote").attr(
  "href",
  "https://twitter.com/intent/tweet?hashtags=quotes&related=freecodecamp&text=" +
  encodeURIComponent('"' + quote + '" ' + author));

}

$(document).ready(function () {
  // Example of setting the quote dynamically
  getRandomQuote();
  $("#new-quote").on("click", getRandomQuote);
});