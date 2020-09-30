import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';
import Root from './root';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Root />, root);
});
