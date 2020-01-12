var firstSq = document.querySelector("#firstSquare");
var secondSq = document.querySelector("#secondSquare");
var thirdSq = document.querySelector("#thirdSquare");
var fourthSq = document.querySelector("#fourthSquare");
var fifthSq =  document.querySelector("#fifthSquare");
var sixthSq = document.querySelector("#sixthSquare");

function allBoxColorChange (){

	if(answerBoxNumber !== 0){
		firstSq.style.backgroundColor = "rgb(" + Math.floor(Math.random() * 256) + ", " + Math.floor(Math.random() * 256) + ", " + Math.floor(Math.random() * 256) + ")";

	}  
	if(answerBoxNumber !== 1){
		secondSq.style.backgroundColor = "rgb(" + Math.floor(Math.random() * 256) + ", " + Math.floor(Math.random() * 256) + ", " + Math.floor(Math.random() * 256) + ")";


	}  
	if(answerBoxNumber !== 2){
		thirdSq.style.backgroundColor = "rgb(" + Math.floor(Math.random() * 256) + ", " + Math.floor(Math.random() * 256) + ", " + Math.floor(Math.random() * 256) + ")";


	}  
	if(answerBoxNumber !== 3){
		fourthSq.style.backgroundColor = "rgb(" + Math.floor(Math.random() * 256) + ", " + Math.floor(Math.random() * 256) + ", " + Math.floor(Math.random() * 256) + ")";


	}  
	if(answerBoxNumber !== 4){
		fifthSq.style.backgroundColor = "rgb(" + Math.floor(Math.random() * 256) + ", " + Math.floor(Math.random() * 256) + ", " + Math.floor(Math.random() * 256) + ")";


	}  
	if(answerBoxNumber !== 5){
		sixthSq.style.backgroundColor = "rgb(" + Math.floor(Math.random() * 256) + ", " + Math.floor(Math.random() * 256) + ", " + Math.floor(Math.random() * 256) + ")"; 


	} 
}

var pageTop = document.querySelector("#pageTop");

function backgroundChanger() {

	var sq = document.querySelectorAll(".colorBox");
	for (var i = 0; i < sq.length; i++){

	sq[i].addEventListener("click", function(){

		if(this.style.backgroundColor !== "rgb(" + randomRed + ", " + randomGreen + ", " + randomBlue + ")"){

			this.style.backgroundColor = "black";
		}
		else {

			pageTop.style.backgroundColor = "rgb(" + randomRed + ", " + randomGreen + ", " + randomBlue + ")";

			for (var i = 0; i < sq.length; i++){

				sq[i].style.backgroundColor = "rgb(" + randomRed + ", " + randomGreen + ", " + randomBlue + ")";

			}
		}

	

	});

}
}



var redVal = document.querySelector("#redValue");
var greenVal = document.querySelector("#greenValue");
var blueVal = document.querySelector("#blueValue");

var answerBoxNumber = Math.floor(Math.random() * 6);

var randomRed = Math.floor(Math.random() * 256);
var randomGreen = Math.floor(Math.random() * 256);
var randomBlue = Math.floor(Math.random() * 256);


function assignAnswerColor () {

	if (answerBoxNumber == 0){

		changeColor(firstSq);

	} else if(answerBoxNumber == 1) {

		changeColor(secondSq);

	} else if(answerBoxNumber == 2) {

		changeColor(thirdSq);

	} else if(answerBoxNumber == 3) {

		changeColor(fourthSq);

	} else if(answerBoxNumber == 4) {

		changeColor(fifthSq);

	} else if(answerBoxNumber == 5) {

		changeColor(sixthSq);

	}

}

function changeColor(sq) {
	
	sq.style.backgroundColor = "rgb(" + randomRed + ", " + randomGreen + ", " + randomBlue + ")";

}
      

function changeRGBvalues(redVal, greenVal, blueVal) {
	
	redVal.textContent = randomRed;
	greenVal.textContent = randomGreen;
	blueVal.textContent = randomBlue;

}

changeRGBvalues(redVal, greenVal, blueVal);
assignAnswerColor();
allBoxColorChange();




function newColors () {

	var newColorsLink = document.querySelector("#newColorsLink");
	newColorsLink.addEventListener("click", function(){

	pageTop.style.backgroundColor = "black";
	answerBoxNumber = Math.floor(Math.random() * 6);
	randomRed = Math.floor(Math.random() * 256);
	randomGreen = Math.floor(Math.random() * 256);
	randomBlue = Math.floor(Math.random() * 256);
	changeRGBvalues(redVal, greenVal, blueVal);
	assignAnswerColor();
	allBoxColorChange();
	})

}

newColors();
backgroundChanger();