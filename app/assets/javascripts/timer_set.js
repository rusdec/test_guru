document.addEventListener('turbolinks:load', () => {
  const by_time = document.querySelector('#test_with_timer');
  const timer = document.querySelector('div.test_timer');

  if (by_time && timer) {
    let params = {by_time: by_time, timer: timer}
    toggleTimer(params)
    by_time.addEventListener('click', () => toggleTimer(params))
  }

  function toggleTimer(params) {
    if (params.by_time.checked) {
      params.timer.classList.remove('hidden')
    } else {
      params.timer.classList.add('hidden')
    }
  }
})
