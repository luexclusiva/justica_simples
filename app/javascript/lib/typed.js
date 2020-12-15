import Typed from 'typed.js';

var options = {
  strings: ['','<p>Entenda seu processo e <strong>garanta seu Direito</strong></p>'],
  typeSpeed: 75,
  showCursor: false,
  loop: false,
  contentType: 'html',
  fadeOut: false,
  startDelay: 20
  };

var typed = new Typed('.typed', options);

export { typed }
