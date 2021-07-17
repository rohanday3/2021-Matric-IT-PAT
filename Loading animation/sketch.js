// Note that this runs a bit slow because of the colour processing

let angle1 = 0, angle2 = 0;
let size = 400, rad = size / 2;

let angleChange = 0, angleRotate = 0;
let angleSlider, rotateSlider, stepsSlider;

function setup() {
    createCanvas(windowWidth, windowHeight - 40, WEBGL);

    // min, max, start, step
    angleSlider = createSlider(0, 100, 50, 1);
    rotateSlider = createSlider(0, 100, 25, 1);
    stepsSlider = createSlider(1, 10, 6, 1);
}

function draw() {
    ortho();
    colorMode(HSL);
    background(255);

    rotateX(angleRotate); // Rotate camera

    // Create path
    let path = [], steps = 100;
    let angle1 = 0, angle2 = HALF_PI;

    for (let i = 0; i < steps; i++) {
        let x = rad * cos(angle1) * cos(angle2);
        let y = rad * sin(angle1) * cos(angle2);
        let z = rad * sin(angle2);
        path.push([x, y, z]);

        angle1 += PI / steps * sin(angleChange) * stepsSlider.value();
        angle2 += PI / steps;
    }

    // Draw line
    noFill();
    stroke(0);
    strokeWeight(10);

    for (let i = 0; i < path.length; i++) {
        beginShape(); // Render normal path

        stroke([map(i, 0, path.length, 0, 255), 100, 70]);

        const v0 = path[i];
        vertex(v0[0], v0[1], v0[2]);
        if (i === 0) vertex(-v0[0], -v0[1], v0[2]); // Join to reversed path

        if (i > 0) {
            const v1 = path[i-1];
            vertex(v1[0], v1[1], v1[2]);
        }

        endShape();
    }

    for (let i = 0; i < path.length; i++) {
        beginShape(); // Render reversed path

        stroke([map(i, 0, path.length, 0, 255), 100, 70]);

        const v0 = path[i];
        vertex(-v0[0], -v0[1], v0[2]);
        if (i === path.length - 1) vertex(v0[0], v0[1], v0[2]); // Join to normal path

        if (i > 0) {
            const v1 = path[i-1];
            vertex(-v1[0], -v1[1], v1[2]);
        }

        endShape();
    }

    // Animate rotation and number of path spins
    angleRotate += rotateSlider.value() / 2 ** 12;
    angleChange += angleSlider.value() / 2 ** 12;

    // Reset limits
    if (angleRotate > TWO_PI) angleRotate -= TWO_PI;
    if (angleChange > TWO_PI) angleChange -= TWO_PI;
}
