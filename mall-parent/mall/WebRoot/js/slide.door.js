var currentObja1 = document.getElementById("link2d11");
var currentObjb1 = document.getElementById("d11");

function showtitle1(obja) {
    var objectbid = obja.id.substr(5);
    objb = document.getElementById(objectbid);

    obja.className = "on";
    objb.style.display = "block";

    if (currentObja1 != null && currentObjb1 != null && currentObja1 != obja && currentObjb1 != objb) {
        currentObja1.className = "";
        currentObjb1.style.display = 'none';
    }
    currentObja1 = obja;
    currentObjb1 = objb;
}

showtitle1(currentObja1);
 

var currentObja2 = document.getElementById("link2d21");
var currentObjb2 = document.getElementById("d21");

function showtitle2(obja) {
    var objectbid = obja.id.substr(5);
    objb = document.getElementById(objectbid);

    obja.className = "on";
    objb.style.display = "block";

    if (currentObja2 != null && currentObjb2 != null && currentObja2 != obja && currentObjb2 != objb) {
        currentObja2.className = "";
        currentObjb2.style.display = 'none';
    }
    currentObja2 = obja;
    currentObjb2 = objb;
}

showtitle2(currentObja2);


