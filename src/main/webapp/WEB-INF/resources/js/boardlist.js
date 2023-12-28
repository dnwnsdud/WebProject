//@ts-nocheck
// Ajax는 두종류의 명칭으로 쓰인다
// Ajax라는 기본 통신형 대분류 명칭
// Jquery의 Ajax 기술의 명칭이 Ajax
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
// XMLHttpRequest -> 클래스 new XMLHttpRequest()
// fetch -> 함수 fetch(url)
// fetch는 url과 options 을 넣으면 해당하는 url로 request를 보내고 response를 받는 일방형 통신 기술
// 페이지 이동이 특별히 필요하지 않으면 없다
// fetch는 결과값으로 무엇을 돌려주는가?
// 결과값을 Promise 형태로 받아오기 때문
function ajax(url, option) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            return [2 /*return*/, fetch(url, option).then(function (res) { return res.json(); })];
        });
    });
}
// form -> submit
// formdata가 파일을 전송하때 자동적으로 boundary 작업 -> 경계선
// Encrypt Data -> 암호화 정보
// AjaxFilter에 password로 Hello를 보내면
// Hello+EncodeData 를 전송
// AjaxFilter는 +EncodeData를 떼고 Hello만 출력
var form = new FormData();
form.append("password", "Hello+EncodeData");
ajax("/api/boardlist", {
    method: "POST",
    body: form,
    // headers: {
    //   "Content-Type": "application/json",
    //   "Authorization": "ABCD",
    //   // "User-Agent": "robots" // IOS, WINDOW, ANDROID
    // },
    // // body:new FormData()
    // mode: "cors",
    // cache: "default",
    // // no-store, reload, no-cache, force-cache, only-if-cached
    // redirect: "follow",
    // // follow, error, menual
    // referrer: "no-referrer",
    // // strict-origin, unsafe
}).then(function (json) {
    console.log(json);
    var boards = document.querySelector("#boards");
    var template = document.querySelector("#boards template");
    if (template) {
        for (var _i = 0, _a = json.data; _i < _a.length; _i++) {
            var data = _a[_i];
            template.content.querySelector(".id").innerHTML = data.id;
            template.content.querySelector(".title").innerHTML = data.title;
            template.content.querySelector(".author").innerHTML = data.boardUser.name;
            var div = document.createElement("div");
            div.innerHTML = template.innerHTML;
            if (boards) {
                boards.appendChild(div);
            }
        }
    }
});
// filter
// fetch("/api/boardlist", {
//   method: "POST",
// })
//   .then((res) => res.json())
//   .then((json) => {
//     console.log(json);
//   });
