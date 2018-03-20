document.addEventListener('turbolinks:load', function() {
  var testPassageProgressBarContainer = document.querySelector('#test-passage-progress-bar-container .bar');

  if (testPassageProgressBarContainer) {
    let progressBar = new ProgressBar({
      containerSelector: '#test-passage-progress-bar-container .bar',
      localization: {
        description: {
          text: "Вопрос %c% из %t%"
        }
      },
      params: {
        background: { width: '100%', fill: '#f0f0f0' },
        bar: { fill: '#e64980', height: '12px' },
        description: { fill: '#fff', 'font-size': "10px", x: '3px' }
      }
    }).render()
  }
});
