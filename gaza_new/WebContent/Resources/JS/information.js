/* 테이블탭 메뉴 이벤트 */
const tabletabEvent = (type) => {
    const menus = document.querySelectorAll(type + ' li>label');
    menus.forEach(menu => {
        menu.addEventListener('click', e => {
            menus.forEach(_menu => document.getElementById(_menu.previousElementSibling.id+'-container').classList.add('hidden'));
            if(e.target.tagName === "LABEL") document.getElementById(e.target.previousElementSibling.id+'-container').classList.remove('hidden');
        });
    });
};

/* drift 채팅 */

const chatService = () => {
    "use strict";

    !function() {
        var t = window.driftt = window.drift = window.driftt || [];
        if (!t.init) {
            if (t.invoked) return void (window.console && console.error && console.error("Drift snippet included twice."));
            t.invoked = !0, t.methods = [ "identify", "config", "track", "reset", "debug", "show", "ping", "page", "hide", "off", "on" ],
                t.factory = function(e) {
                    return function() {
                        var n = Array.prototype.slice.call(arguments);
                        return n.unshift(e), t.push(n), t;
                    };
                }, t.methods.forEach(function(e) {
                t[e] = t.factory(e);
            }), t.load = function(t) {
                var e = 3e5, n = Math.ceil(new Date() / e) * e, o = document.createElement("script");
                o.type = "text/javascript", o.async = !0, o.crossorigin = "anonymous", o.src = "https://js.driftt.com/include/" + n + "/" + t + ".js";
                var i = document.getElementsByTagName("script")[0];
                i.parentNode.insertBefore(o, i);
            };
        }
    }();
    drift.SNIPPET_VERSION = '0.3.1';
    drift.load('w27c27educhn');
};


(() => {

    <!-- Start of Async Drift Code -->
    "use strict";
    !function() {
        var t = window.driftt = window.drift = window.driftt || [];
        if (!t.init) {
            if (t.invoked) return void (window.console && console.error && console.error("Drift snippet included twice."));
            t.invoked = !0, t.methods = [ "identify", "config", "track", "reset", "debug", "show", "ping", "page", "hide", "off", "on" ],
                t.factory = function(e) {
                    return function() {
                        var n = Array.prototype.slice.call(arguments);
                        return n.unshift(e), t.push(n), t;
                    };
                }, t.methods.forEach(function(e) {
                t[e] = t.factory(e);
            }), t.load = function(t) {
                var e = 3e5, n = Math.ceil(new Date() / e) * e, o = document.createElement("script");
                o.type = "text/javascript", o.async = !0, o.crossorigin = "anonymous", o.src = "https://js.driftt.com/include/" + n + "/" + t + ".js";
                var i = document.getElementsByTagName("script")[0];
                i.parentNode.insertBefore(o, i);
            };
        }
    }();
    drift.SNIPPET_VERSION = '0.3.1';
    drift.load('w27c27educhn');
    <!-- End of Async Drift Code -->


    if (location.pathname.indexOf('faq') !== -1) {
       const questions = document.querySelectorAll('.accordion-title');
        questions.forEach(question => {
            question.addEventListener('click', () =>{
                const expanded = document.querySelector('.is-expanded');
                if(question.parentElement.classList.contains('is-expanded')) question.parentElement.classList.remove('is-expanded');
                else {
                    if(expanded) expanded.classList.remove('is-expanded');
                    question.parentElement.classList.add('is-expanded');
                }
            });
        });
    }else {
       // 서비스안내에서 메인네비 하단줄 제거
       menuBorderRemover();

       // 서비스안내 서브네비 클릭이벤트
        const firstMenu = ['탑승안내','수하물안내','고객안내','부가서비스'];
        const menuList = [[['예약안내','reservation'],['체크인안내','checkIn'],['운임안내', 'fare']],[['수하물이용', 'baggage_guide'], ['위탁수하물', 'baggage_free'], ['수하물보상', 'baggage_compensation']],
            [['유아여행안내', 'infant'], ['임신고객안내', 'pregnant'], ['장애인고객안내', 'disabled_passenger'], ['패밀리서비스','family_service'], ['반려동물동반', 'with_pets'], ['의료도움이 필요한 고객', 'medical'], ['기내건강', 'cabin_health']],
            [['레그룸좌석','legroom'], ['비즈니스존','businesszone'], ['프론트존','frontzone'], ['듀오좌석','duo'], ['이코노미','economysmartium'], ['업그레이드', 'upgradestandby'], ['기내와이파이', 'wifi'], ['기내통신판매','domestic']]];

        const menu1 = document.querySelector('#first_menu>div');
        const menu2 = document.querySelector('#second_menu>div');
        menu1.addEventListener('click', () => {
            menu1.previousElementSibling.innerText = event.target.innerText;
            let index;
            if (event.target.innerHTML === '탑승안내') index = 0;
            else if (event.target.innerHTML === '수하물안내') index = 1;
            else if (event.target.innerHTML === '고객안내') index = 2;
            else if (event.target.innerHTML === '부가서비스') index = 3;
            menu2.previousElementSibling.innerText = menuList[index][0][0];
            let txt = '';
            for (let i = 0; i < menuList[index].length; i++)
                txt += ('<div class="menu-item"><a href="' + menuList[index][i][1] + '?abc=' + index + '&zyx=' + i +'">' + menuList[index][i][0] + '</a></div>');
            menu2.innerHTML = txt;
        });
        const location_href = location.href;
        if (location_href.indexOf('abc') && location_href.indexOf('zyx')) {
            const index1 = location_href.charAt(location_href.indexOf('abc') + 4);
            const index2 = location_href.charAt(location_href.indexOf('zyx') + 4);
            menu1.previousElementSibling.innerText = firstMenu[index1];
            menu2.previousElementSibling.innerText = menuList[index1][index2][0];
            let txt = '';
            for (let i = 0; i < menuList[index1].length; i++)
                txt += ('<div class="menu-item"><a href="' + menuList[index1][i][1] + '?abc=' + index1 + '&zyx=' + i +'">' + menuList[index1][i][0] + '</a></div>');
            menu2.innerHTML = txt;
        }

       if(location.pathname.indexOf('reservation') !== -1) {
           tabEvent('.tab-menu1');
           tabletabEvent('#table-tab-1');
           tabletabEvent('#table-tab-2');
       }
       else if (location.pathname.indexOf('fare') !== -1) {
           tabEvent('.tab-menu1');
       }else if (location.pathname.indexOf('infant') !== -1) {
           tabEvent('.tab-menu1');
       }else if (location.pathname.indexOf('medical') !== -1) {
           tabEvent('.tab-menu1');
       }else if (location.pathname.indexOf('baggage_free') !== -1) {
           tabEvent('.tab-menu1');
       }else if (location.pathname.indexOf('baggage_compensation') !== -1) {
           tabEvent('.tab-menu1');
       } else if (location.pathname.indexOf('cabin_health') !== -1) {
           const questions = document.querySelectorAll('.accordion-title');
           questions.forEach(question => {
               question.addEventListener('click', () =>{
                   const expanded = document.querySelector('.is-expanded');
                   if(question.parentElement.classList.contains('is-expanded')) question.parentElement.classList.remove('is-expanded');
                   else {
                       if(expanded) expanded.classList.remove('is-expanded');
                       question.parentElement.classList.add('is-expanded');
                   }
               });
           });
       }
   }
})();