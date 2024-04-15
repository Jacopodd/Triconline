function mesePrev() {
    currentMonth--;
    if (currentMonth < 0) {
        currentMonth = 11;
        currentYear--;
    }
    updateCalendar(currentYear, currentMonth);
}

function meseNext() {
    currentMonth++;
    if (currentMonth > 11) {
        currentMonth = 0;
        currentYear++;
    }
    updateCalendar(currentYear, currentMonth);
}

function updateCalendar(year, month) {
    var daysInMonth = new Date(year, month + 1, 0).getDate();
    var firstDay = new Date(year, month, 1).getDay();
    var calendarDays = document.querySelector('.calendar-days');
    calendarDays.innerHTML = '';

    document.getElementById('month-year').textContent = getMonthName(month) + ' ' + year;

    for (var i = 1; i <= daysInMonth + firstDay; i++) {
        var dayElement = document.createElement('div');
        if (i > firstDay) {
            dayElement.textContent = i - firstDay;
            dayElement.classList.add('day');
            dayElement.addEventListener('click', function() {
                alert('Hai cliccato il giorno ' + this.textContent);
            });
        }
        calendarDays.appendChild(dayElement);
    }
}

function getMonthName(month) {
    var months = ['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Giugno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre'];
    return months[month];
}

var currentMonth = new Date().getMonth();
var currentYear = new Date().getFullYear();

updateCalendar(currentYear, currentMonth);
