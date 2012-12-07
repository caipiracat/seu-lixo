// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .
//= require bootstrap-transition
//= require bootstrap-modal
//= require bootstrap-dropdown
//= require bootstrap-scrollspy
//= require bootstrap-tab
//= require bootstrap-tooltip
//= require bootstrap-popover
//= require bootstrap-button
//= require bootstrap-collapse
//= require bootstrap-carousel
//= require bootstrap-typeahead
//= require contador
//= require jsapi

function Odometer (parentDiv,opts) {
    if (!parentDiv) throw "ERROR: Odometer object must be past a document element.";

    this.digits       = 6;
    this.tenths       = 0;
    this.digitHeight  = 80;
    this.digitPadding = 0;
    this.digitWidth   = 60;
    this.bustedness   = 2;
    this.fontStyle    = "font-family: Courier New, Courier, monospace; font-weight: 900;";
    this.value        = -1;

    for (var key in opts) { this[key] = opts[key]; }

    var style = {
        digits:        "position:absolute; height:"+this.digitHeight+"px; width:"+(this.digitWidth-(2*this.digitPadding))+"px; "+
                       "padding:"+this.digitPadding+"px; font-size:"+(this.digitHeight-(2*this.digitPadding))+"px; "+
                       "background:white; color:black; text-align:center; "+this.fontStyle,
        columns:       "position:relative; float:left; overflow:hidden;"+
                       "height:"+this.digitHeight+"px; width:"+this.digitWidth+"px;",
        highlight:     "position:absolute; background:green; opacity:0.25; filter:alpha(opacity=25); width:100%; left:0px;",
        //lowlight:      "position:absolute; background:black; opacity:0.25; filter:alpha(opacity=25); width:100%; left:0px;",
        //sidehighlight: "position:absolute; background:white; opacity:0.50; filter:alpha(opacity=50); height:100%; top:0px;",
        //sidelowlight:  "position:absolute; background:black; opacity:0.50; filter:alpha(opacity=50); height:100%; top:0px;"
    };

    var highlights = [
        "top:56%;   height:32%;" + style.highlight,
        "top:63.5%; height:16%;" + style.highlight,
        "top:68.5%; height:6%;"  + style.highlight,
        "right:0%;  width:6%;"   + style.sidelowlight,
        "left:0%;   width:4%;"   + style.sidehighlight,
        "top:0%;    height:14%;" + style.lowlight,
        "bottom:0%; height:25%;" + style.lowlight,
        "bottom:0%; height:8%;"  + style.lowlight
    ];

    this.setDigitValue = function (digit, val, frac) {
  var di = digitInfo[digit];
        var px = Math.floor(this.digitHeight * frac);
  px = px + di.offset;
  if (val != di.last_val) {
    var tmp = di.digitA;
    di.digitA = di.digitB;
    di.digitB = tmp;
          di.digitA.innerHTML = val;
          di.digitB.innerHTML = (1+Number(val)) % 10;
    di.last_val = val;
  }
  if (px != di.last_px) {
          di.digitA.style.top = (0-px)+"px";
          di.digitB.style.top = (0-px+this.digitHeight)+"px";
    di.last_px = px;
  }
    };


    this.set = function (inVal) {
        if (inVal < 0) throw "ERROR: Odometer value cannot be negative.";
  this.value = inVal;
  if (this.tenths) inVal = inVal * 90;
        var numb = Math.floor(inVal);
        var frac = inVal - numb;
  numb = String(numb);
        for (var i=0; i < this.digits; i++) {
            var num = numb.substring(numb.length-i-1, numb.length-i) || 0;
            this.setDigitValue(this.digits-i-1, num, frac);
            if (num != 9) frac = 0;
        }
    };

    this.get = function () {
        return(this.value);
    };


    var odometerDiv = document.createElement("div")
    odometerDiv.setAttribute("id","odometer");
    odometerDiv.style.cssText="text-align: left";
    parentDiv.appendChild(odometerDiv);

    var digitInfo = new Array();
    for (var i=0; i < this.digits; i++) {
        var digitDivA = document.createElement("div");
        digitDivA.setAttribute("id","odometer_digit_"+i+"a");
        digitDivA.style.cssText=style.digits;

        var digitDivB = document.createElement("div");
        digitDivB.setAttribute("id","odometer_digit_"+i+"b");
        digitDivB.style.cssText = style.digits;

        var digitColDiv = document.createElement("div");
        digitColDiv.style.cssText = style.columns;

        digitColDiv.appendChild(digitDivB);
        digitColDiv.appendChild(digitDivA);

        for (var j in highlights) {
            var hdiv = document.createElement("div");
            hdiv.innerHTML="<p></p>"; // For Dumb IE
            hdiv.style.cssText = highlights[j];
            digitColDiv.appendChild(hdiv);
        }
        odometerDiv.appendChild(digitColDiv);
  var offset = Math.floor(Math.random()*this.bustedness);
  digitInfo.push({digitA:digitDivA, digitB:digitDivB, last_val:-1, last_px: -1, offset:offset});
    };


//    if (this.tenths) {
//  digitInfo[this.digits - 1].digitA.style.background = "#cccccc";
//  digitInfo[this.digits - 1].digitB.style.background = "#cccccc";
//  digitInfo[this.digits - 1].digitA.style.color = "#000000";
//  digitInfo[this.digits - 1].digitB.style.color = "#000000";
//    }

    if (this.value >= 0) this.set(this.value);
}

