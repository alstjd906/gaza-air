/**
 * 
 */

const print = () => {
    var headstr = "<html><head><title></title></head><body>";
    var footstr = "</body>";
    var newstr = document.getElementById('result').innerHTML;
    document.body.innerHTML = headstr + newstr + footstr;
    window.print();
    location.reload();
    return false;
};

const calendarEvent = () => {
    const inputs = document.querySelectorAll('input[type=text][id^=flightDate-');
    for (let i = 1; i<=inputs.length; i++)
        calendar[i-1] = cal_generator('flightDate-' + i);
    document.querySelectorAll(".lightpick").forEach(lightpick => lightpick.classList.add('centeredXY') );
    overlay.addEventListener('click', () => {
        for (let i = 1; i<=inputs.length; i++) cal_init(i);
        document.querySelectorAll(".lightpick").forEach(lightpick => lightpick.classList.add('centeredXY') );
    });
};

function periodInit(months) {
	const date1 = document.getElementById('flightDate-1');
	const date2 = document.getElementById('flightDate-2');
	
	if (months === "custom") {
		date1.value = date2.value = "";
		date1.removeAttribute('disabled');
		date2.removeAttribute('disabled');
	} else {
		const now = new Date();
		date2.value = `${now.getFullYear()}-${now.getMonth()+1}-${now.getDate()}`;
		const tempDate = new Date(now.getFullYear(), now.getMonth()-months, now.getDate());
		date1.value = `${tempDate.getFullYear()}-`; `${tempDate.getMonth()+1}-${tempDate.getDate()}`;
		if (tempDate.getMonth() < 9) date1.value += `0${tempDate.getMonth()+1}-`;
		else date1.value += `${tempDate.getMonth()+1}-`;
		if (tempDate.getDate() < 10) date1.value += `0${tempDate.getDate()}`;
        else date1.value += `${tempDate.getDate()}`;
		date1.setAttribute('disabled' , 'disabled');
		date2.setAttribute('disabled' , 'disabled');
		// document.getElementById('startDate').innerHTML = date1.value;
		// document.getElementById('endDate').innerHTML = date2.value;
	}
}

/**********************************************************************/

/* 좌석 선택 */

function drawSeatImg() {
    var seatList = "";
    var alphabet = ["A","B","C","D","E","F","G","H","J","K"];
    var four = 0;
    for(j=1;j<3;j++){
        seatList += "<div class='busiseat-row'>";
        for(i=0;i<alphabet.length;i++){
            if(four%4 != 0)
            	seatList += '<span><img src=\"'+x+'/Resources/IMG/mypage_Img/seat_default.png\" id=\"'+j+alphabet[i]+'\" onclick=\"change(this.id)\"/></span>';
            else 
            	seatList += '<span><img src=\"'+x+'/Resources/IMG/mypage_Img/seat_gray.png\" id=\"'+j+alphabet[i]+'\" onclick=\"change(this.id)\"/></span>';
            four++;
        }
        seatList += "</div>";
    }
    document.getElementById("frontBusi-seat").innerHTML = seatList;

    seatList = "";
    for(j=3; j<16; j++) {
        seatList += "<div class='seat-row'>";
        for(i=0; i<alphabet.length;i++){
        	if(four%7 != 0 && four%9 != 0)
            	seatList += '<span><img src=\"'+x+'/Resources/IMG/mypage_Img/seat_default.png\" id=\"'+j+alphabet[i]+'\" onclick=\"change(this.id)\"/></span>';
            else 
            	seatList += '<span><img src=\"'+x+'/Resources/IMG/mypage_Img/seat_gray.png\" id=\"'+j+alphabet[i]+'\" onclick=\"change(this.id)\"/></span>';
            four++;
        }
        seatList += "</div>";
    }
    document.getElementById("frontEco-seat").innerHTML = seatList;

    seatList = "";
    for(j=16; j<27; j++) {
        seatList += "<div class='seat-row'>";
        for(i=0; i<alphabet.length;i++){
        	if(four%4 != 0 && four%9 != 0)
            	seatList += '<span><img src=\"'+x+'/Resources/IMG/mypage_Img/seat_default.png\" id=\"'+j+alphabet[i]+'\" onclick=\"change(this.id)\"/></span>';
            else 
            	seatList += '<span><img src=\"'+x+'/Resources/IMG/mypage_Img/seat_gray.png\" id=\"'+j+alphabet[i]+'\" onclick=\"change(this.id)\"/></span>';
            four++;
        }
        seatList += "</div>";
    }
    document.getElementById("back-seat").innerHTML = seatList;
}

function change(targetId){
    var imgSrc = document.getElementById(targetId).src;
    var selectedSeat = document.querySelector('img[src$="seat_red.png"]');
    if (imgSrc.indexOf('red') !== -1)
        document.getElementById(targetId).src = x+"/Resources/IMG/mypage_Img/seat_default.png";
    else if (imgSrc.indexOf('default') !== -1) {
        if (selectedSeat) selectedSeat.src = x+"/Resources/IMG/mypage_Img/seat_default.png";
        document.getElementById(targetId).src = x+"/Resources/IMG/mypage_Img/seat_red.png";
    }
}
/***********************************************************/

function edit() {

}


(() => {
	 if(location.pathname.indexOf('myhome') !== -1) {
		 const mileage_percent = my_mileage/(my_mileage+need_mileage);
         const add_num = Math.round(my_mileage/70);
         //메인 상단부 마일리지 원형 그래프
         setTimeout(() => {
             $('.circle').circleProgress({
                 value: mileage_percent,
                 size: 300,
                 thickness: 15,
                 fill: { color: '#36f' },
                 startAngle: -Math.PI / 2,
             }).on('circle-animation-progress', function() {
                 $(this).find('strong').text(parseInt($(this).find('strong').text()) + add_num);
             }).on('circle-animation-end', function () {
                 $(this).find('strong').text(my_mileage);
             });
         }, 1000);
         
         document.querySelector('#mileagebar>div>div:first-of-type').style.width = (mileage_percent*100) + '%';
         document.querySelector('#mileagebar>div>div:last-of-type').style.marginLeft = (mileage_percent*100-3) + '%';
     }

     else if(location.pathname.indexOf('mileage') !== -1) {
         hintWindow('mileage-expiration', true, true, true);
         tabEvent('.tab-menu1');
         calendarEvent();

         document.getElementById('mileage-print').addEventListener('click', print);
     }

     else if(location.pathname.indexOf('reservation_list') !== -1) {
         calendarEvent();
     }

     else if(location.pathname.indexOf('purchase_list') !== -1) {
         calendarEvent();
         periodInit(document.querySelector('input[name=period]:checked').id.split('-')[2]);
         const periodRadios = document.querySelectorAll('input[name=period]');
         periodRadios.forEach(periodRadio => periodRadio.addEventListener('change', () => periodInit(document.querySelector('input[name=period]:checked').id.split('-')[2])));
     }

     else if(location.pathname.indexOf('interested_route') !== -1) {
         openPicker('.open-airport-picker', true);
     }

     else if(location.pathname.indexOf('reservation_detail') !== -1){
         drawSeatImg();

         hintWindow('selectFood', true, true, true);
         hintWindow('selectSeat', true, true, true);
         hintWindow('selectClass', true, true, true);
         overlay.addEventListener('click', () => {
             const popups = document.querySelectorAll('.pop-up-window-type1');
             popups.forEach(popup => popup.style.display = 'none');
             overlay.style.display = 'none';
         });

         birth_option_generator();
     }
     else if (location.pathname.indexOf('Grade') !== -1) {
         tabEvent('.tab-menu1');
     }
})();