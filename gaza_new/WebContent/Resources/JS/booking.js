/* 나이 계산기 */
const calculateAge = dateString => {

    const year = dateString.substring(0,4);
    const month = dateString.substring(4,6);
    const day = dateString.substring(6,8);
    const birthDate = new Date(year, month-1, day);
    const today = Date.now();
    const ageDifMs = today - birthDate.getTime();
    const ageDate = new Date(ageDifMs);

    const temp = ageDate.getUTCFullYear() - 1970;

    if(dateString.length < 8 || year > new Date().getFullYear() || month > 12 || day > new Date(year, month, 0).getDate() || temp < 0) {
        document.getElementById('ageCalc-result').textContent = '올바른 생년월일이 아닙니다.';
        return false;
    }

    let age;
    if(temp >= 12) age = '성인';
    else if(temp >= 2) age = '소아';
    else age = '유아';

    document.getElementById('ageCalc-result').textContent = `탑승일 ${getISODate(new Date())} 기준으로 입력한 생년월일은 ${age} 입니다.`;
};

const calculateAgeInit = () => {
    document.getElementById('btn-ageCalc').addEventListener('click', ()=> {
        document.getElementById('ageCalc-result').textContent = "";
        document.getElementById('txtBirthDate').value = "";
    });

    document.getElementById('btn-ageCalc-calc').addEventListener('click', () => calculateAge(document.getElementById('txtBirthDate').value));

    /* 나이 계산기 외 다른 부분 클릭시 */
    overlay.addEventListener('click', () => document.getElementById('btn-ageCalc-window').style.display = 'none' );
};

const getISODate = date => {
    const year = date.getFullYear();
    let month = (1 + date.getMonth());
    month = month >= 10 ? month : '0' + month;
    let day = date.getDate();
    day = day >= 10 ? day : '0' + day;
    return `${year}-${month}-${day}`;
};

/* 출발공항 도착공항 변경 */
const spotChange = () => {
    let spotChangeBtns = document.querySelectorAll('.spot-change');
    spotChangeBtns.forEach(elem => {
        elem.addEventListener('click', () => {
            const index = event.target.id.charAt(event.target.id.length-1);
            const temp = document.getElementById('airportFrom-' + index).value;
            document.getElementById('airportFrom-' + index).value = document.getElementById('airportTo-' + index).value;
            document.getElementById('airportTo-' + index).value = temp;
        })
    });
};

/* insertAfter */
const insertAfter = (referenceNode, newNode) => {
    if (!!referenceNode.nextSibling) referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
    else referenceNode.parentNode.appendChild(newNode);
};

/* 조회버튼 클릭시 */
const input_check = () => {
    // 유효성검사
    let isValid = false;
    // 여정의 타입 저장 (왕복, 편도, 다구간)
    document.querySelector('input[name="flight-type"]').value = document.querySelector('input[type="radio"][name="trip-type"]:checked').value;
    // 출도착 공항 및 비행날짜 저장
    const airportFroms = Array.prototype.slice.call(document.querySelectorAll('input[id^=airportFrom]'));
    const airportTos = Array.prototype.slice.call(document.querySelectorAll('input[id^=airportTo]'));
    const flightDates = Array.prototype.slice.call(document.querySelectorAll('input[id^=flightDate]'));
    const airportFromInput = document.querySelector('input[name="airportFrom"]');
    const airportToInput = document.querySelector('input[name="airportTo"]');
    const flightDateInput = document.querySelector('input[name="flightDate"]');
    for (let i = 0; i<airportFroms.length; i++) {
        if (airportFroms[i].value !== "" && airportTos[i].value !== "" && flightDates[i].value !== "") {
            isValid = true;
            if (airportFromInput.value) {
                airportFromInput.value += "&" + airportFroms[i].value;
                airportToInput.value += "&" + airportTos[i].value;
                flightDateInput.value += "&" + flightDates[i].value;
            } else {
                airportFromInput.value += airportFroms[i].value;
                airportToInput.value += airportTos[i].value;
                flightDateInput.value += flightDates[i].value;
            }
        }
    }
    // 승객수 저장
    document.querySelector('input[name="numOfPassengers"]').value = strPassengers_generator();
    // session에 좌석타입 저장 (이코노미, 비즈니스, 퍼스트)
    document.querySelector('input[name="seat-type"]').value = document.querySelector('input[name="class-type"]:checked + label').innerText;


    if (!isValid) alert("출,도착 공항 및 탑승일을 선택하여 주십시오.\n- 다구간에서는 최소한 하나이상의 여정을 완성하여야 합니다.");
    else document.getElementById('nextEventFrm').submit();

    return isValid;
};


function toBooking3(){
    if (sessionStorage.getItem('prices')) sessionStorage.removeItem('prices');
    if (sessionStorage.getItem('prices2')) sessionStorage.removeItem('prices2');
    if (sessionStorage.getItem('flightArr')) sessionStorage.removeItem('flightArr');
    if (sessionStorage.getItem('numOfPassenger')) sessionStorage.removeItem('numOfPassenger');
    let priceArr = [];
    let priceArr2 = [];
    let flightArr = [];
    const numOfPassenger = document.getElementById('num-of-passengers').value;
    for(var i = 1; i <= document.querySelectorAll('div.journey-wrapper').length; i++) {
        const target = document.querySelector('input[name=flight-ticket-'+i+']:checked');
        if(!target) {
            alert('각 여행별 비행기티켓을 모두 선택해주세요.');
            return false;
        }
        priceArr.push(document.getElementById('lastPrice-'+i).innerText);
        priceArr2.push(target.nextElementSibling.nextElementSibling.lastElementChild.innerText);
        const targetParent = target.parentElement.parentElement;
        const cnt = target.parentElement.parentElement.childElementCount;
        flightArr.push([targetParent.children[cnt-3].value, targetParent.children[cnt-2].value, targetParent.children[cnt-1].value]);
    }
    sessionStorage.setItem('prices', JSON.stringify(priceArr));
    sessionStorage.setItem('prices2', JSON.stringify(priceArr2));
    sessionStorage.setItem('flightArr', JSON.stringify(flightArr));
    sessionStorage.setItem('numOfPassengers', numOfPassenger);
    return true;
}


// booking 3 view
function booking3View() {
    const numOfPassengers = sessionStorage.getItem('numOfPassengers');
    const passengers = [];
    passengers.push(numOfPassengers.indexOf('성인'));
    passengers.push(numOfPassengers.indexOf('소아'));
    passengers.push(numOfPassengers.indexOf('유아'));
    let k = 1;

    for (let i = 0; i < passengers.length; i++) {
        if (passengers[i] !== -1) {
            document.getElementById('reservation-info').insertAdjacentHTML('beforebegin', `
            <li class="subtitle">
                <span>${numOfPassengers.substring(passengers[i],passengers[i]+4)}</span>
            </li>`);
            for (let j = 1; j <= numOfPassengers.charAt(passengers[i]+3); j++) {
                document.getElementById('reservation-info').insertAdjacentHTML('beforebegin', `<div class="table-wrapper" id="table${k++}">
                    <div class="table-form">
                        <div class="row clearfix">
                            <div class="table-row-title">
                                성
                            </div>
                            <div class="two-in-row">
                                <input type="text" placeholder="한글 성 입력 (예:홍)" name="lastname">
                            </div>
                            <div class="table-row-title">
                                이름
                            </div>
                            <div class="two-in-row">
                                <input type="text" placeholder="한글 이름 입력 (예:길동)" name="firstname">
                            </div>
                        </div>
            
                        <div class="row clearfix">
                            <div class="table-row-title">
                                생년월일
                            </div>
                            <div>
                                <select id="year" name="year" title="생년월일&nbsp;연도" style="width: 200px">
                                    <option value="">년</option>
                                    <option value="2019">2019년</option>
                                    <option value="2018">2018년</option>
                                    <option value="2017">2017년</option>
                                    <option value="2016">2016년</option>
                                    <option value="2015">2015년</option>
                                    <option value="2014">2014년</option>
                                    <option value="2013">2013년</option>
                                    <option value="2012">2012년</option>
                                    <option value="2011">2011년</option>
                                    <option value="2010">2010년</option>
                                    <option value="2009">2009년</option>
                                    <option value="2008">2008년</option>
                                    <option value="2007">2007년</option>
                                    <option value="2006">2006년</option>
                                    <option value="2005">2005년</option>
                                    <option value="2004">2004년</option>
                                    <option value="2003">2003년</option>
                                    <option value="2002">2002년</option>
                                    <option value="2001">2001년</option>
                                    <option value="2000">2000년</option>
                                    <option value="1999">1999년</option>
                                    <option value="1998">1998년</option>
                                    <option value="1997">1997년</option>
                                    <option value="1996">1996년</option>
                                    <option value="1995">1995년</option>
                                    <option value="1994">1994년</option>
                                    <option value="1993">1993년</option>
                                    <option value="1992">1992년</option>
                                    <option value="1991">1991년</option>
                                    <option value="1990">1990년</option>
                                    <option value="1989">1989년</option>
                                    <option value="1988">1988년</option>
                                    <option value="1987">1987년</option>
                                    <option value="1986">1986년</option>
                                    <option value="1985">1985년</option>
                                    <option value="1984">1984년</option>
                                    <option value="1983">1983년</option>
                                    <option value="1982">1982년</option>
                                    <option value="1981">1981년</option>
                                    <option value="1980">1980년</option>
                                    <option value="1979">1979년</option>
                                    <option value="1978">1978년</option>
                                    <option value="1977">1977년</option>
                                    <option value="1976">1976년</option>
                                    <option value="1975">1975년</option>
                                    <option value="1974">1974년</option>
                                    <option value="1973">1973년</option>
                                    <option value="1972">1972년</option>
                                    <option value="1971">1971년</option>
                                    <option value="1970">1970년</option>
                                    <option value="1969">1969년</option>
                                    <option value="1968">1968년</option>
                                    <option value="1967">1967년</option>
                                    <option value="1966">1966년</option>
                                    <option value="1965">1965년</option>
                                    <option value="1964">1964년</option>
                                    <option value="1963">1963년</option>
                                    <option value="1962">1962년</option>
                                    <option value="1961">1961년</option>
                                    <option value="1960">1960년</option>
                                    <option value="1959">1959년</option>
                                    <option value="1958">1958년</option>
                                    <option value="1957">1957년</option>
                                    <option value="1956">1956년</option>
                                    <option value="1955">1955년</option>
                                    <option value="1954">1954년</option>
                                    <option value="1953">1953년</option>
                                    <option value="1952">1952년</option>
                                    <option value="1951">1951년</option>
                                    <option value="1950">1950년</option>
                                    <option value="1949">1949년</option>
                                    <option value="1948">1948년</option>
                                    <option value="1947">1947년</option>
                                    <option value="1946">1946년</option>
                                    <option value="1945">1945년</option>
                                    <option value="1944">1944년</option>
                                    <option value="1943">1943년</option>
                                    <option value="1942">1942년</option>
                                    <option value="1941">1941년</option>
                                    <option value="1940">1940년</option>
                                </select>
            
                                <select id="month" name="month" title="생년월일월" style="width: 200px">
                                    <option value="">월</option>
                                    <option value="01">1월</option>
                                    <option value="02">2월</option>
                                    <option value="03">3월</option>
                                    <option value="04">4월</option>
                                    <option value="05">5월</option>
                                    <option value="06">6월</option>
                                    <option value="07">7월</option>
                                    <option value="08">8월</option>
                                    <option value="09">9월</option>
                                    <option value="10">10월</option>
                                    <option value="11">11월</option>
                                    <option value="12">12월</option>
                                </select>
            
                                <select id="day" name="day" title="생년월일일" style="width: 200px">
                                    <option value="">일</option>
                                    <option value="01">1일</option>
                                    <option value="02">2일</option>
                                    <option value="03">3일</option>
                                    <option value="04">4일</option>
                                    <option value="05">5일</option>
                                    <option value="06">6일</option>
                                    <option value="07">7일</option>
                                    <option value="08">8일</option>
                                    <option value="09">9일</option>
                                    <option value="10">10일</option>
                                    <option value="11">11일</option>
                                    <option value="12">12일</option>
                                    <option value="13">13일</option>
                                    <option value="14">14일</option>
                                    <option value="15">15일</option>
                                    <option value="16">16일</option>
                                    <option value="17">17일</option>
                                    <option value="18">18일</option>
                                    <option value="19">19일</option>
                                    <option value="20">20일</option>
                                    <option value="21">21일</option>
                                    <option value="22">22일</option>
                                    <option value="23">23일</option>
                                    <option value="24">24일</option>
                                    <option value="25">25일</option>
                                    <option value="26">26일</option>
                                    <option value="27">27일</option>
                                    <option value="28">28일</option>
                                    <option value="29">29일</option>
                                    <option value="30">30일</option>
                                    <option value="31">31일</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row clearfix">
                            <div class="table-row-title">
                                성별
                            </div>
                            <div class="gender-wrapper">
                                <input type="radio" class="radio3" name="gender-${k}" id="male-${k}" value="M">
                                <label for="male-${k}">남성</label>
                                <input type="radio" class="radio3" name="gender-${k}" id="female-${k}" value="F">
                                <label for="female-${k}">여성</label>
                            </div>
                        </div>
                    </div>
                </div>`);
            }
        }
    }
    const airportFromTxt = document.querySelector('input[name=airportFrom]');
    const airportToTxt = document.querySelector('input[name=airportTo]');
    const flightNumTxt = document.querySelector('input[name=flightNum]');
    const flightArr = JSON.parse(sessionStorage.getItem('flightArr'));
    for (let i =0; i<flightArr.length; i++ ) {
        if (i !== 0) {
            airportFromTxt.value += "#@!";
            airportToTxt.value += "#@!";
            flightNumTxt.value += "#@!";
        }
        airportFromTxt.value += flightArr[i][0];
        airportToTxt.value += flightArr[i][1];
        flightNumTxt.value += flightArr[i][2];
    }
}

function toBooking4() {
    if (sessionStorage.getItem('passengerArr')) sessionStorage.removeItem('passengerArr');
    if (sessionStorage.getItem('reservationInfo')) sessionStorage.removeItem('reservationInfo');
    let passengerArr = [];

    const tables = document.querySelectorAll('.table-wrapper');
    let isFilled = true;
    tables.forEach(table => {
        const lastname = document.querySelector(`#${table.id} input[name=lastname]`).value;
        const firstname = document.querySelector(`#${table.id} input[name=firstname]`).value;
        if (!lastname || !firstname) isFilled = false;
        const name =  lastname + " " + firstname;
        const birthSelects = document.querySelectorAll(`#${table.id} select`);
        let birthDate = "";
        birthSelects.forEach(birthSelect => {
            if (birthSelect.selectedIndex === 0) isFilled = false;
            if (birthSelect.name !== 'year') birthDate += "/";
            birthDate += birthSelect[birthSelect.selectedIndex].value;
        });
        const gender = document.querySelector(`#${table.id} input[name^=gender-]:checked`);
        if (!gender) isFilled = false;
        else passengerArr.push([name, birthDate, gender.value]);
    });
    const emailDomain = document.getElementById('emailDomain');
    const emailAddress = document.getElementById('emailAddress');

    let emailFull, phone, directronics = "";
    if (emailDomain.selectedIndex === 0) emailFull = emailAddress.value + "@" + document.getElementById('emailDomainText').value;
    else emailFull = emailAddress.value + "@" + emailDomain[emailDomain.selectedIndex].value;

    let reg = /\w{4,12}[@][a-z]{2,10}[.][a-z]{2,3}[.]?[a-z]{0,2}/;
    if(!reg.test(emailFull)) isFilled = false;

    phone = document.getElementById('phone');
    if (!phone.value) isFilled = false;

    if (document.getElementById('email').checked) directronics += 'on';
    else directronics += 'off';
    directronics += '/';
    if (document.getElementById('sms').checked) directronics += 'on';
    else directronics += 'off';

    if (isFilled) {
        sessionStorage.setItem('passengerArr', JSON.stringify(passengerArr));
        sessionStorage.setItem('reservationInfo', JSON.stringify([emailFull, phone.value, directronics]));
        document.getElementById('booking3frm').submit();
    } else {
        alert("모든 입력칸을 완성해주십시오.");
        return false;
    }
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function booking4View() {
    const priceList = JSON.parse(sessionStorage.getItem('prices2'));
    let calcPriceList = JSON.parse(sessionStorage.getItem('prices'));
    let lastPrice = 0;
    for (let i = 0; i < priceList.length; i++) {
        while (priceList[i].indexOf(',') !== -1)
            priceList[i] = priceList[i].replace(',', '');
        document.querySelector('.price-'+(i+1)+'-1').innerText = numberWithCommas(Math.round(priceList[i] * 0.7));
        document.querySelector('.price-'+(i+1)+'-2').innerText = numberWithCommas(Math.round(priceList[i] * 0.1));
        document.querySelector('.price-'+(i+1)+'-3').innerText = numberWithCommas(Math.round(priceList[i] * 0.2));
        document.querySelector('.price-'+(i+1)+'-4').innerText = sessionStorage.getItem('numOfPassengers');
        document.querySelector('.price-'+(i+1)+'-5').innerText = calcPriceList[i];
        while(calcPriceList[i].indexOf(',') !== -1)
            calcPriceList[i] = calcPriceList[i].replace(',', '');
        lastPrice += parseInt(calcPriceList[i]);
    }
    document.querySelector('.last-price').innerText = numberWithCommas(lastPrice) + ' 원';

    const airportFromTxt = document.querySelector('input[name=airportFrom]');
    const airportToTxt = document.querySelector('input[name=airportTo]');
    const flightNumTxt = document.querySelector('input[name=flightNum]');
    const flightArr = JSON.parse(sessionStorage.getItem('flightArr'));
    for (let i =0; i<flightArr.length; i++ ) {
        if (i !== 0) {
            airportFromTxt.value += "#@!";
            airportToTxt.value += "#@!";
            flightNumTxt.value += "#@!";
        }
        airportFromTxt.value += flightArr[i][0];
        airportToTxt.value += flightArr[i][1];
        flightNumTxt.value += flightArr[i][2];
    }
}

function toPayment() {
    if(document.getElementById('agree_1').checked && document.getElementById('agree_2').checked &&
        document.getElementById('agree_3').checked)
        document.getElementById('booking4frm').submit();
    else {
        alert('모두 항목에 동의하셔야 예약이 가능합니다.');
        return false;
    }
}

(() => {
    if(location.pathname.indexOf('booking1') !== -1) {
        /* 각종 안내 버튼 이벤트 */
        hintWindow('passenger-hint');
        hintWindow('class-hint');
        hintWindow('multi-way-hint', true, true, false);
        hintWindow('btn-ageCalc', true, true, true);

        /* 공항 picker */
        openPicker('.open-airport-picker');

        /* 캘린더 */
        cal_init();

        // overlay 클릭시 달력도 종료되도록
        overlay.addEventListener('click', () => cal_init(calendar_openedBy) );

        /* 여정/날짜 선택 */

        /* 체크박스 이벤트 */
        let checkboxElems = document.querySelectorAll('input[name="trip-type"]');
        checkboxElems.forEach(elem => elem.addEventListener('change', () => cal_init()));

        /* 컴포넌트 display 이벤트 */
        // 아니 왜 change 이벤트리스너 작동을 안하냐
        // Todo 코드 더러워서 나중에 다시 봐야겠다..
        document.querySelector('.type-radio-box').addEventListener('mouseup', e => {
            let temp = e.target.previousElementSibling;

            if (temp.id === "round-way")
                document.getElementById('note').classList.add('hidden');
            else
                document.getElementById('note').classList.remove('hidden');

            if (temp.id === "multi-way")
                document.getElementById('multi-way-btn-box').classList.remove('hidden');
            else {
                document.getElementById('multi-way-btn-box').classList.add('hidden');
                let btns = document.getElementById('multi-way-btn-box');
                let input_forms = document.querySelectorAll('.book-input-form');
                for(let i = 1; i<input_forms.length; i++)
                    btns.parentElement.removeChild( btns.previousElementSibling );
            }
        });

        /* 다구간섹션에서 여행선택폼 줄 추가/제거 이벤트 */
        document.querySelector('.add').addEventListener('click', () => {
            let input_forms = document.querySelectorAll('.book-input-form');
            let num_of_forms = input_forms.length;
            if(num_of_forms >= 6) {
                document.querySelector('#note>p').classList.remove('hidden');
                return false;
            }
            document.querySelector('#note>p').classList.add('hidden');

            let div = document.createElement('div');
            div.setAttribute('class','row clearfix book-input-form');
            let temp = input_forms[num_of_forms-1].innerHTML;
            input_forms[num_of_forms-1].parentElement.insertBefore(div, document.getElementById('multi-way-btn-box'));
            div.innerHTML = temp;

            //
            let btns = document.getElementById('multi-way-btn-box');
            let targetElem = btns.previousElementSibling;
            let str;


            for(let i = 0; i<targetElem.children.length; i++) {
                str = targetElem.children[i].firstElementChild.htmlFor;
                str = str.substr(0, str.length-1) + (num_of_forms + 1);

                targetElem.children[i].firstElementChild.htmlFor = str;
                targetElem.children[i].lastElementChild.id = str;
                targetElem.children[i].lastElementChild.name = str;

                if(i === 0) {
                    const strId = targetElem.children[i].children[1].id;
                    targetElem.children[i].children[1].id = strId.substr(0, strId.length-1) + (num_of_forms + 1);
                }

                if (str.indexOf('flightDate') !== -1)
                    calendar[num_of_forms] = cal_generator(str, document.getElementById('flightDate-'+num_of_forms).value);
            }
            openPicker('.open-airport-picker');

            document.getElementById('spot-change-' + (num_of_forms+1)).addEventListener('click', () => {
                const temp = document.getElementById('airportFrom-' + (num_of_forms+1)).value;
                document.getElementById('airportFrom-' + (num_of_forms+1)).value = document.getElementById('airportTo-' + (num_of_forms+1)).value;
                document.getElementById('airportTo-' + (num_of_forms+1)).value = temp;
            });
        });

        document.querySelector('.subtr').addEventListener('click', () => {
            let input_forms = document.querySelectorAll('.book-input-form');
            let num_of_forms = input_forms.length;
            if(num_of_forms <= 1) {
                document.querySelector('#note>p').classList.remove('hidden');
                return false;
            }
            document.querySelector('#note>p').classList.add('hidden');
            let btns = document.getElementById('multi-way-btn-box');
            btns.parentElement.removeChild( btns.previousElementSibling);
        });

        spotChange();

        /* 탑승인원 선택 */
        /* 나이 계산기 이벤트 */
        calculateAgeInit();

        /* 승객수 + - 버튼 이벤트 */
        changeNumOfPassengers();

    }

    else if (location.pathname.indexOf('booking2') !== -1) {

        // 메뉴 하단 선 제거
        menuBorderRemover();

        /* 팝업창 */
        hintWindow('num-of-passengers', true, true);
        hintWindow('btn-ageCalc', true, true, true);

        document.getElementById('num-of-passengers').addEventListener('click', e => {
            const _scrollTop = window.scrollY || document.documentElement.scrollTop;
            document.getElementById('num-of-passengers-window').style.top = _scrollTop + e.target.getBoundingClientRect().bottom + 15 + 'px';
        });

        //캘린더
        if (document.getElementById('trip-type').value === 'multi-way' ) {
            for (let i = 1; i <= document.querySelectorAll('div[id^=journey-').length; i++) {
                calendar[i - 1] = cal_generator('flightDate-' + i, document.getElementById('flightDate-' + i).value);
                calendar[i - 1].el.classList.add('centeredX');
            }
            overlay.addEventListener('click', () => cal_init(calendar_openedBy));
        } else
            cal_init();
        //공항picker
        openPicker('.open-airport-picker');

        /* 승객수 + - 버튼 이벤트 */
        changeNumOfPassengers();

        /* 탑승객 팝업에서 선택 클릭시 */
        const passengerNum = document.getElementById('num-of-passengers');

        document.querySelector('#selectBtn').addEventListener('click', () => {
            if(strPassengers_generator()) {
                passengerNum.value = strPassengers_generator();
                document.getElementById('num-of-passengers-window').style.display = 'none';
                overlay.style.display = 'none';
            }
        });

        /* 탑승객 팝업 오픈시 입력된 값 가져오기 */
        passengerNum.addEventListener('click', () => {
            const totalNum = passengerNum.value;

            let adultNum = totalNum.charAt(totalNum.indexOf('성인')+3);
            let childNum = totalNum.charAt(totalNum.indexOf('소아')+3);
            let infantNum = totalNum.charAt(totalNum.indexOf('유아')+3);
            if (totalNum.indexOf('성인') === -1) adultNum = 0;
            if (totalNum.indexOf('소아') === -1) childNum = 0;
            if (totalNum.indexOf('유아') === -1) infantNum = 0;
            document.getElementById('numOfAdult').value = adultNum;
            document.getElementById('numOfChild').value = childNum;
            document.getElementById('numOfInfant').value = infantNum;
        });

        /* 탑승객 팝업에서 다른 부분 클릭시 */
        overlay.addEventListener('click', () => document.getElementById('num-of-passengers-window').style.display = 'none' );

        /* 나이 계산기 이벤트 */
        calculateAgeInit();

        document.querySelector('#btn-ageCalc-window .btn-close').addEventListener('click', () => {
            overlay.style.display = 'block';
            document.getElementById('num-of-passengers-window').style.display = 'block';
        });

        /* 티켓 선택시 */
        const ticket_select = () => {
            document.querySelectorAll('.flight-ticket-table td>label').forEach(elem => {
                elem.addEventListener('click', e => {
                    const target_journey = e.target.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.id;
                    const selected = document.querySelector(`#${target_journey} .selected-ticket`);
                    if (selected) {
                        selected.classList.remove('selected-ticket');
                        selected.style.backgroundColor = '#eee';
                        selected.style.borderBottomColor = selected.parentElement.style.borderBottomColor = '#ddd';
                        selected.parentElement.parentElement.removeChild(selected.parentElement.nextElementSibling);
                    }
                    const parent = e.target.parentElement;
                    let price = e.target.nextElementSibling.lastElementChild.innerText;
                    while (price.indexOf(',') !== -1)
                        price = price.replace(',', '');

                    const totalNum = passengerNum.value;

                    let adultNum = totalNum.charAt(totalNum.indexOf('성인') + 3);
                    let childNum = totalNum.charAt(totalNum.indexOf('소아') + 3);
                    let infantNum = totalNum.charAt(totalNum.indexOf('유아') + 3);
                    //
                    let tableRow = document.createElement("TR");
                    tableRow.style.border = "1px solid";
                    let tempText = "<td colspan='7' class='price-div'><div class='col-two-fifth'><div class='col-two-fifth'>선택된 항공편 운임</div><div class='col-three-fifth'>";
                    const eventTarget = e.target.htmlFor.charAt(e.target.htmlFor.length - 1);
                    if (eventTarget === "1") {
                        tableRow.style.backgroundColor = tableRow.style.borderColor = parent.style.backgroundColor = parent.parentElement.style.borderBottomColor = "#9bf";
                        tempText += "60% 할인";
                    } else if (eventTarget === "2") {
                        tableRow.style.backgroundColor = tableRow.style.borderColor = parent.style.backgroundColor = parent.parentElement.style.borderBottomColor = "#69f";
                        tempText += "50% 할인";
                    } else if (eventTarget === "3") {
                        tableRow.style.backgroundColor = tableRow.style.borderColor = parent.style.backgroundColor = parent.parentElement.style.borderBottomColor = "#36f";
                        tempText += "정상 가격";
                    }
                    tempText += `</div></div><div class="col-three-fifth"><span class="people-type">(성인 ${adultNum})</span><span>${(price * adultNum).toLocaleString()}</span>`;
                    if (childNum !== " ") tempText += `<span>+</span><span class="people-type">(소아 ${childNum})</span><span>${(price / 200 * 100 * childNum).toLocaleString()}</span>`;
                    if (infantNum !== " ") tempText += `<span>+</span><span class="people-type">(유아 ${infantNum})</span><span>0</span>`;
                    const index = e.target.htmlFor.charAt(8);
                    tempText += `<span>=</span> KRW <span id="lastPrice-${index}">${((price * adultNum) + (price / 200 * 100 * childNum)).toLocaleString()}</span></div></td>`;
                    tableRow.innerHTML = tempText;
                    insertAfter(parent.parentElement, tableRow);
                    e.target.parentElement.classList.add('selected-ticket');
                });
            });
        };
        ticket_select();

        /* 테이블정렬 */
        const ticketRowsArray = [
            Array.prototype.slice.call(document.querySelectorAll('#journey-1 tr')),
            Array.prototype.slice.call(document.querySelectorAll('#journey-2 tr')),
            Array.prototype.slice.call(document.querySelectorAll('#journey-3 tr')),
            Array.prototype.slice.call(document.querySelectorAll('#journey-4 tr')),
            Array.prototype.slice.call(document.querySelectorAll('#journey-5 tr')),
            Array.prototype.slice.call(document.querySelectorAll('#journey-6 tr')),
        ];
        let orderMultiplier = 1;
        document.querySelectorAll('input[id^=sort-by]').forEach(item => {
            item.addEventListener('click', ()=> {
                let sortedTicketRows;
                if (item.classList.contains('checked')) orderMultiplier *= -1;
                else orderMultiplier = 1;
                if (orderMultiplier === -1) item.classList.add('reverse-order');
                else item.classList.remove('reverse-order');
                const index = item.id.charAt(item.id.length-1);
                if (item.id.indexOf('departure') !== -1) {
                    sortedTicketRows = ticketRowsArray[index-1].sort( (a, b) => {
                            const tempA = a.children[0].innerText;
                            const tempB = b.children[0].innerText;
                            return tempA === tempB? 0 : tempA>tempB? orderMultiplier : -orderMultiplier;
                        }
                    );
                } else if (item.id.indexOf('arrival') !== -1) {
                    sortedTicketRows = ticketRowsArray[index-1].sort( (a, b) => {
                            const tempA = a.children[2].innerText;
                            const tempB = b.children[2].innerText;
                            return tempA === tempB? 0 : tempA>tempB? orderMultiplier : -orderMultiplier;
                        }
                    );
                } else if (item.id.indexOf('flight') !== -1) {
                    sortedTicketRows = ticketRowsArray[index-1].sort( (a, b) => {
                            let tempA = a.children[1].innerText;
                            let tempB = b.children[1].innerText;
                            if (tempA.length>tempB.length) return orderMultiplier;
                            if (tempB.length>tempA.length) return -orderMultiplier;
                            return tempA === tempB? 0 : tempA>tempB? orderMultiplier : -orderMultiplier;
                        }
                    );
                } else if (item.id.indexOf('price') !== -1) {
                    sortedTicketRows = ticketRowsArray[index - 1].sort((a, b) => {
                            const tempA = a.children[6].children[2].lastElementChild.innerText;
                            const tempB = b.children[6].children[2].lastElementChild.innerText;
                            return tempA === tempB ? 0 : tempA > tempB ? orderMultiplier : -orderMultiplier;
                        }
                    );
                }
                const targetBody = document.querySelector(`#journey-${index} tbody`);
                targetBody.innerHTML = "";
                sortedTicketRows.forEach(ticketRow => targetBody.innerHTML += ticketRow.outerHTML);

                document.querySelector(`#journey-${index} input.checked`).classList.remove('checked');
                item.classList.add('checked');
                const selected = document.querySelector(`#journey-${index} .selected-ticket`);
                if (selected) {
                    selected.classList.remove('selected-ticket');
                    selected.style.backgroundColor = '#eee';
                    selected.style.borderBottomColor = selected.parentElement.style.borderBottomColor = '#ddd';
                }
                ticket_select();
            });
        });

        // 날짜 선택시 ajax
        $(".price-of-day label").click(function() {
            var targetJourneyIndex = $(this).attr('for').charAt(8);
            var dateMod = $(this).attr('for').charAt(16)-4;
            var targetAirportFrom = $("#journey-airportFrom-"+targetJourneyIndex).val();
            var targetAirportTo = $("#journey-airportTo-"+targetJourneyIndex).val();
            var targetFlightDate = $("#journey-flightDate-"+targetJourneyIndex).val();
            $.ajax({
                url : "changeDate",
                type : "POST",
                data : `airportFrom=${targetAirportFrom}&airportTo=${targetAirportTo}&flightDate=${targetFlightDate}&dateMod=${dateMod}`,
                success : function(result){
                    if(result !== "") {
                        alert(result);
                    }else
                        alert("ss");
                },
                error : function(){
                    alert("비행기표검색에 실패했습니다.");
                }
            })
        });

        /* waypoint */
        // 상단바 변경
        $('.cur-route').waypoint(function(direction) {
            if (direction === "down") {
                $('.cur-route').addClass('sticky');
            } else {
                $('.cur-route').removeClass('sticky');
            }
        }, {
            offset: '10px;'
        });

        // 섹션별 여정 설명바
        for (let i = 1; i <= 6; i++) {
            $('#journey-'+i).waypoint(direction => {
                if (direction === "down") $(`#journey-${i} .journey-name-fixed`).removeClass('hidden');
                else $('.journey-name-fixed').addClass('hidden');
            }, {
                offset: '-1px;'
            });

            if ($('#journey-' + (i + 1)).length) {
                $('#journey-' + (i + 1)).waypoint(direction => {
                    if (direction === "up") $(`#journey-${i} .journey-name-fixed`).removeClass('hidden');
                    else $('.journey-name-fixed').addClass('hidden');
                }, {
                    offset: '200px;'
                });
            } else {
                $('.flex').waypoint(direction => {
                    if (direction === "down") $('.journey-name-fixed').addClass('hidden');
                    else $(`#journey-${i} .journey-name-fixed`).removeClass('hidden');
                }, {
                    offset: '200px;'
                });
                break;
            }
        }
    }

    else if (location.pathname.indexOf('booking3') !== -1) {
        booking3View();

        const emailSelect = document.getElementById("emailDomain");
        const emailDomainText = document.getElementById("emailDomainText");
        emailSelect.addEventListener('change', () => {
            if (emailSelect.selectedIndex === 0) emailDomainText.removeAttribute('disabled');
            else {
                emailDomainText.value = "";
                emailDomainText.setAttribute('disabled', 'disabled');
            }
        });

        const input = document.getElementById("phone");
        window.intlTelInput(input, {
            dropdownContainer: document.body,
            initialCountry: "kr",
            preferredCountries: ['kr', 'us', 'cn'],
            utilsScript: "../../../Vendor/intl-tel-input-16.0.0/build/js/utils.js",
        });
    }
    else if (location.pathname.indexOf('booking4') !== -1) {
        booking4View();


    }
})();