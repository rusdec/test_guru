document.addEventListener('turbolinks:load', () => {
  var timer = document.querySelector('#timer')

  if (timer) {
    var remainingSeconds = Number.parseFloat(timer.dataset.remainingSeconds)
    var countdown = () => { return (remainingSeconds > 0) ? remainingSeconds -= 1 : 0 }
    var timerIcon = document.querySelector('i.fa-clock')
    setInterval(remainingTime, every_seconds(1))
  }

  function every_seconds(n) {
    return n*1000
  }

  function remainingTime() {
    let sec = countdown()
    if (sec > 0) {
      printRemainingTime(sec)
      setTimerDeadlineColor(sec, 60)
    } else {
      finishTest()
    }
  }

  function setTimerDeadlineColor(sec, deadlineSec) {
    let deadlineClass = 'deadline-timer'
    if (!timer.classList.contains(deadlineClass) && sec <= deadlineSec) {
      [timerIcon, timer].forEach((element) => {
        element.classList.add(deadlineClass)
      })
    }
  }

  function printRemainingTime(sec) {
    timer.textContent = sec.toString().toHHMMSS()
  }

  function secondsToTime(seconds) {
    let time = seconds
    return seconds
  }

  function finishTest() {
    simulateClick('#apply_answer') 
  }

  function simulateClick(selector) {
    let evnt = document.createEvent("MouseEvents")
    evnt.initMouseEvent("click", true, true, window,
      0, 0, 0, 0, 0, false, false, false, false, 0, null)
    var element = document.querySelector(selector)
    element.dispatchEvent(evnt)
  }

  /**
   * https://stackoverflow.com/questions/6312993/javascript-seconds-to-time-string-with-format-hhmmss
   */
  String.prototype.toHHMMSS = function () {
    let sec_num = parseInt(this, 10)
    let hours = Math.floor(sec_num / 3600)
    let minutes = Math.floor((sec_num - (hours * 3600)) / 60)
    let seconds = sec_num - (hours * 3600) - (minutes * 60)

    if (hours < 10) {hours = "0"+hours}
    if (minutes < 10) {minutes = "0"+minutes}
    if (seconds < 10) {seconds = "0"+seconds}
    return hours+':'+minutes+':'+seconds
  }
})
