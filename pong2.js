/* Element vi arbetar med */
const eCanvas = document.querySelector("canvas");
const eForm = document.querySelector("form");
const eNamn1 = document.querySelector("#namn1");
const eNamn2 = document.querySelector("#namn2");
const knappStart = document.querySelector("#start");
const knappStop = document.querySelector("#stop");
const eNamnet1 = document.querySelector("#namnet1");
const eNamnet2 = document.querySelector("#namnet2");
const ePoäng1 = document.querySelector("#poäng1");
const ePoäng2 = document.querySelector("#poäng2");
const eHighscore = document.querySelector("#highscore");

/* Ställ in bredd och storlek */
eCanvas.width = 600;
eCanvas.height = 500;

/* Globala variabler */
var ctx = eCanvas.getContext("2d");
var boll = {
    radie: 15,
    x: 200,
    y: 200,
    dx: 1,
    dy: 1
};
var racket_1 = {
    x: 10,
    y: 0,
    ned: false,
    upp: false,
    bredd: 20,
    höjd: 100
};
var racket_2 = {
    x: 570,
    y: 0,
    ned: false,
    upp: false,
    bredd: 20,
    höjd: 100
};
var startFlagga = false;
var poäng = 0;

/* Skapa ljudobjekt */
studs = new Audio("./studs.wav");
smash = new Audio("./smash.wav");

/* Läs highscore från databasen */
lasaHighscore();

/* Starta spelet när vi trycker på Start */
eForm.addEventListener("submit", function(e) {
    e.preventDefault();

    if (!startFlagga) {
        sparaNamn();
        startFlagga = true;
        reset();
    }
});

/* Stanna spelet när man trycker på Stop */
knappStop.addEventListener("click", function() {
    startFlagga = false;
});

/* Lyssna på tangenter */
window.addEventListener("keydown", function(e) {
    switch (e.key) {
        case "ArrowUp":
            racket_1.upp = true;
            break;
        case "ArrowDown":
            racket_1.ned = true;
            break;
        case "w":
                racket_2.upp = true;
                break;
        case "s":
                racket_2.ned = true;
                break;
    }
});
window.addEventListener("keyup", function(e) {
    switch (e.key) {
        case "ArrowUp":
            racket_1.upp = false;
            break;
        case "ArrowDown":
            racket_1.ned = false;
            break;
        case "w":
            racket_2.upp = false;
            break;
        case "s":
            racket_2.ned = false;
            break;
    }
});




/* Startvärden */
ctx.fillStyle = "#FFF";
function reset() {
    boll.x = Math.random() * 500 + 50;
    boll.y = Math.random() * 400 + 50;
    boll.dx = 5;
    boll.dy = 5;
    animate();
}

/* Ritar en boll */
function ritaBoll() {
    ctx.beginPath();
    ctx.arc(boll.x, boll.y, boll.radie, 0, Math.PI * 2);
    ctx.fill();
}

/* Ritar en racket */
function ritaRacket() {
    ctx.beginPath();
    ctx.fillRect(racket_1.x, racket_1.y, racket_1.bredd, racket_1.höjd);
    ctx.beginPath();
    ctx.fillRect(racket_2.x, racket_2.y, racket_2.bredd, racket_2.höjd);
}

/* Game Over */


/* Animationsloopen */
function animate() {
    /* Tömma skärmen */
    ctx.clearRect(0, 0, 600, 500);

    /* Rita bollen */
    ritaBoll();

    /* Rita racketen */
    ritaRacket();

    /* Flytta racketen */
    if (racket_1.ned) {
        if (racket_1.y < 500 - racket_1.höjd) {
            racket_1.y += 5;
        }
    }
    if (racket_1.upp) {
        if (racket_1.y > 0) {
            racket_1.y -= 5;
        }
    }
    if (racket_2.ned) {
        if (racket_2.y < 500 - racket_2.höjd) {
            racket_2.y += 5;
        }
    }
    if (racket_2.upp) {
        if (racket_2.y > 0) {
            racket_2.y -= 5;
        }
    }

    /* Bollen skall studsa på racketen */
    if (boll.y >= racket_1.y && boll.y <= racket_1.y + racket_1.höjd) {
        if (boll.x - boll.radie <= racket_1.x + racket_1.bredd) {
            //console.log("Träff!", poäng);
            boll.dx = -boll.dx;
            

            /* Skriv poängen direkt */
            ePoäng1.textContent = poäng1.value;

            /* Öka hastigheten (svårighetsgraden) */

            smash.play();
        }
    }
    if (boll.y >= racket_2.y && boll.y <= racket_2.y + racket_2.höjd) {
        if (boll.x + boll.radie > racket_2.x) {
            //console.log("Träff!", poäng);
            boll.dx = -boll.dx;
            

            /* Skriv poängen direkt */
            ePoäng2.textContent = poäng2.value;

            /* Öka hastigheten (svårighetsgraden) */

            smash.play();
        }
    }

    /* Bollen träffar väggen bakom racketen = Game Over! */
    //Om vänster spelare släpper in bollen
    if (boll.x <= racket_1.x - 20) {
        console.log("Poäng till", eNamn2.value);
        ePoäng2.textContent = poäng2.value;
        poäng2++;
        reset();
        
    }
    //Om höger spelare släpper in bollen
    if (boll.x >= racket_2.x + 20) {
        console.log("Poäng till", eNamn1.value);
        ePoäng1.textContent = poäng1.value;
        poäng1++;
        reset();
        

    }



    /* Studsa tillbaka från vänsterkanten */
    if (boll.y < boll.radie || boll.y > 500 - boll.radie) {
        boll.dy = -boll.dy;
    }

    /* Förflytta bollen */
    boll.x += boll.dx;
    boll.y += boll.dy;

    /* Här kan vi pausa spelet */
    if (startFlagga) {
        requestAnimationFrame(animate);
    }
}
function sparaNamn() {
    var namn = eNamn1.value;
    console.log("namn=", namn);
    eNamnet1.textContent = eNamn1.value;
    eNamnet2.textContent = eNamn2.value;

    //låser input-rutan
    eNamn1.readOnly;

    //Skapa en ajax för att kunna skicka data

    var ajax = new XMLHttpRequest();

    //Omvandla data till POST
    var postData = new FormData();
    postData.append("namn", namn);

    //Skicka data
    ajax.open("POST", "./spara-namn.php");
    ajax.send(postData);

    //ta emot svaret
    ajax.addEventListener("loadend", function () {
        console.log("Tar emot svar=", this.responseText);
    });
}
function sparaPoäng() {
    var namn = eNamn.value;

    //Skapa en ajax för att kunna skicka data

    var ajax = new XMLHttpRequest();

    //Omvandla data till POST
    var postData = new FormData();
    postData.append("namn", namn);
    postData.append("poäng", poäng);

    //Skicka data
    ajax.open("POST", "./spara-poäng.php");
    ajax.send(postData);

    //ta emot svaret
    ajax.addEventListener("loadend", function () {
        console.log("Tar emot svar=", this.responseText);
    });

    
}

//Hämta highscore
function lasaHighscore() {

    var ajax = new XMLHttpRequest();

    ajax.open("POST", "./läsa-highscore.php");
    ajax.send();

    ajax.addEventListener("loadend", function () {
        console.log("Tar emot svar=", this.responseText);
        eHighscore.innerHTML = this.responseText;
    });

    
}

