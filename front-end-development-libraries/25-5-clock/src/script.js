import React from "https://esm.sh/react";
import ReactDOM from "https://esm.sh/react-dom";
import { createRoot } from "https://esm.sh/react-dom/client";

function App() {
  return (
    <div className="container mt-5 text-center">
      <h1 className="text-center mb-4">25 + 5 Clock</h1>
      <Clock />
    </div>
  );
}

createRoot(document.getElementById("root")).render(<App />);

function Clock() {
  const [breakDurationSeconds, setBreakDurationSeconds] = React.useState(
    5 * 60
  ); // 5 minutes
  const [sessionDurationSeconds, setSessionDurationSeconds] = React.useState(
    25 * 60
  ); // 25 minutes
  const [timerSeconds, setTimerSeconds] = React.useState(25 * 60);
  const [isWorkSession, setIsWorkSession] = React.useState(true);
  const [isRunning, setIsRunning] = React.useState(false);
  const intervalRef = React.useRef(null);
  const audioRef = React.useRef(null);

  function adjustDuration(type, adjustment) {
    if (type === "break") {
      setBreakDurationSeconds((prev) =>
        Math.min(60 * 60, Math.max(60, prev + adjustment))
      );
    } else if (type === "session") {
      setSessionDurationSeconds((prev) => {
        const newDuration = Math.min(60 * 60, Math.max(60, prev + adjustment));
        if (!isRunning && isWorkSession) {
          setTimerSeconds(newDuration);
        }
        return newDuration;
      });
    }
  }

  function handleReset() {
    clearInterval(intervalRef.current);
    setIsRunning(false);
    setIsWorkSession(true);
    setSessionDurationSeconds(25 * 60);
    setBreakDurationSeconds(5 * 60);
    setTimerSeconds(25 * 60);
    audioRef.current.pause();
    audioRef.current.currentTime = 0; // Reset the audio
  }

  function handleStartStop() {
    if (isRunning) {
      clearInterval(intervalRef.current);
      setIsRunning(false);
    } else {
      setIsRunning(true);
      intervalRef.current = setInterval(() => {
        setTimerSeconds((prev) => {
          if (prev <= 0) {
            // Play audio
            audioRef.current.play();
            audioRef.current.currentTime = 0;
            // Switch to the next phase
            setIsWorkSession((prevIsWorkSession) => !prevIsWorkSession);
            const nextDuration = isWorkSession
              ? breakDurationSeconds
              : sessionDurationSeconds;
            setTimerSeconds(nextDuration);
            return nextDuration; // Start the next timer phase
          }
          return prev - 1; // Decrease timer by 1 second
        });
      }, 1000);
    }
  }

  return (
     <div className="card mx-auto p-4 shadow-sm bg-dark bg-gradient" style={{ maxWidth: "400px", color: "#fff" }}>
      <DurationControl
        label="Break"
        durationSeconds={breakDurationSeconds}
        onIncrease={() => adjustDuration("break", 60)}
        onDecrease={() => adjustDuration("break", -60)}
      />

      <DurationControl
        label="Session"
        durationSeconds={sessionDurationSeconds}
        onIncrease={() => adjustDuration("session", 60)}
        onDecrease={() => adjustDuration("session", -60)}
      />

      <Timer
        isWorkSession={isWorkSession}
        isRunning={isRunning}
        time={timerSeconds}
        onStartStop={handleStartStop}
        onReset={handleReset}
      />
      <audio
        id="beep"
        ref={audioRef}
        preload="auto"
        src="https://cdn.freecodecamp.org/testable-projects-fcc/audio/BeepSound.wav"
      ></audio>
    </div>
  );
}

function DurationControl({ label, durationSeconds, onIncrease, onDecrease }) {
  return (
    <div className="mb-3">
      <h5 id={`${label.toLowerCase()}-label`} className="mb-1">
        {label} Length
      </h5>
      <div className="d-flex justify-content-center align-items-center">
        <button
          id={`${label.toLowerCase()}-decrement`}
          className="btn btn-danger btn-sm me-2"
          onClick={onDecrease}
        >
          <i className="fas fa-minus"></i>
        </button>
        <span
          id={`${label.toLowerCase()}-length`}
          className="px-3 py-2 border rounded"
        >
          {durationSeconds / 60}
        </span>
        <button
          id={`${label.toLowerCase()}-increment`}
          className="btn btn-success btn-sm ms-2"
          onClick={onIncrease}
        >
          <i className="fas fa-plus"></i>
        </button>
      </div>
    </div>
  );
}

function Timer({ isWorkSession, isRunning, time, onStartStop, onReset }) {
  function formatTime(seconds) {
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;
    const formattedMinutes = String(minutes).padStart(2, "0");
    const formattedSeconds = String(remainingSeconds).padStart(2, "0");

    return `${formattedMinutes}:${formattedSeconds}`;
  }

  return (
    <div>
      <div id="timer-label" className="fs-4 fw-bold my-3">
        {isWorkSession ? "Session" : "Break"}
      </div>
      <div
        id="time-left"
        className="display-4 fw-bold py-3 rounded border shadow-sm"
      >
        {formatTime(time)}
      </div>
      <div className="d-flex justify-content-center mt-3">
        <button id="start_stop" className="btn btn-primary me-3" onClick={onStartStop}>
          {isRunning ? <div><i className="fas fa-pause"></i> Stop</div> : <div><i className="fas fa-play"></i> Start</div>}
        </button>
        <button id="reset" className="btn btn-secondary" onClick={onReset}>
          <i className="fas fa-redo"></i> Reset
        </button>
      </div>
    </div>
  );
}
