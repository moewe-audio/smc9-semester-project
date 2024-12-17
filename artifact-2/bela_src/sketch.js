const scalingFactor = 800;

function setup() {
	// Create a canvas of dimensions given by the current browser window
	createCanvas(windowWidth, windowHeight);

	textFont('Courier New');
	smooth();

 //   Bela.data.target.addEventListener('buffer-ready', function(event) {
	// // Wait for the buffer containing the voltages before updating both timestamps and voltages
 //   if(event.detail == 1 && typeof Bela.data.buffers[0] != 'undefined')
 //   {
 //   	console.log(Bela.data.buffers[0].length())
 //   }
 //   });
}

function draw() {
	background(255);
	let string1N = Bela.data.buffers[0];
	stroke(0);
	noFill();
	// Draw string1
	beginShape();
	for (let i = 1; i <= string1N; i++) {
		let x = map(i, 1, string1N, 0, width);
		let y = height / 4 - Bela.data.buffers[i] * scalingFactor;
		vertex(x, y);
	}
	endShape();
	// let string2N = Bela.data.buffers[string1N + 1];
	// console.log(string2N);
	// // Draw string2
	// // beginShape();
	// // for (let i = 0; i < string2N; i++) {
	// // 	let bufferIndex = string1N + 2 + i;
	// // 	let x = map(i, 1, string2N, 0, width);
	// // 	let y = height / 2 - Bela.data.buffers[bufferIndex] * scalingFactor;
	// // 	vertex(x, y);
	// // }
	// // endShape();
}
function windowResized() {
	resizeCanvas(windowWidth, windowHeight);
}
