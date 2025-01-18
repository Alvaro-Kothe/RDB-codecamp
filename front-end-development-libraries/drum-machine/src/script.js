import React from "https://esm.sh/react";
import ReactDOM from "https://esm.sh/react-dom";
import { createRoot } from "https://esm.sh/react-dom/client";

const letters = "qweasdzxc".split("");

const audioUrls = [
  "https://cdn.freecodecamp.org/testable-projects-fcc/audio/Heater-1.mp3",
  "https://cdn.freecodecamp.org/testable-projects-fcc/audio/Heater-2.mp3",
  "https://cdn.freecodecamp.org/testable-projects-fcc/audio/Heater-3.mp3",
  "https://cdn.freecodecamp.org/testable-projects-fcc/audio/Heater-4_1.mp3",
  "https://cdn.freecodecamp.org/testable-projects-fcc/audio/Heater-6.mp3",
  "https://cdn.freecodecamp.org/testable-projects-fcc/audio/Dsc_Oh.mp3",
  "https://cdn.freecodecamp.org/testable-projects-fcc/audio/Kick_n_Hat.mp3",
  "https://cdn.freecodecamp.org/testable-projects-fcc/audio/RP4_KICK_1.mp3",
  "https://cdn.freecodecamp.org/testable-projects-fcc/audio/Cev_H2.mp3"
];

const audioIds = ["Heater-1", "Heater-2", "Heater-3", "Heater-4", "Heater-6", "Dsc_Oh", "Kick", "RP4", "Cev"];

const App = () => {
  // Box with drum machine
  // Drum machine contains keys on the left
  // Drum machine reacts to keypresses in the codument
  // Whenever a key is pressed, or the button is pressed, it should display the source
  // It should have clickable buttons.
  return (
    <div className="container my-4">
      <h1 className="text-center mb-4">Drum Machine</h1>
      <DrumMachine />
    </div>
  );
};

createRoot(document.getElementById("root")).render(<App />);

function DrumMachine() {
  const [index, setIndex] = React.useState(-1);
  
  function playAudio(item) {
    if (item === -1) return;
    
    const audioElement = document.getElementById(letters[item].toUpperCase())
    if (audioElement) {
      audioElement.currentTime = 0;
      audioElement.play();
      setIndex(item);
    }
}

  const handleKeyPress = (event) => {
    const keyIndex = letters.indexOf(event.key.toLowerCase());
    playAudio(keyIndex);
  };
  document.addEventListener("keydown", handleKeyPress);

  return (
    <div id="drum-machine">
      {letters.map((el, idx) => <button key={el} 
                                  className="drum-pad"
                                  id={audioIds[idx]}
                                  onClick={() => playAudio(idx)}
                                  >{el.toUpperCase()}
                     <audio className="clip" id={el.toUpperCase()} src={audioUrls[idx]}></audio>
                   </button>)}
      <div id="display">{audioIds[index]}</div>
    </div>
  );
}

function Buttons({ item }) {
  return <div />;
  return (
    <div>
      {letters.map((letter, item) => (
        <button key={letter} onClick={() => playAudio(item)}>
          {letter.toUpperCase()}
        </button>
      ))}
    </div>
  );
}
