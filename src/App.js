import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Hello people, this is Neil Acosta
        </p>
        <a
          className="App-link"
          href="https://neilacostait.com"
          target="_blank"
          rel="noopener noreferrer"
        >
          Open my react resume
        </a>
      </header>
    </div>
  );
}

export default App;
