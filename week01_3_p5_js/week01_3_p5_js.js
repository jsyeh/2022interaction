
function setup() {
    initializeFields();
    createCanvas(500, 500);
}

function draw() {
    background(color(0xFA, 0xFC, 0x94));
    fill(color(0x94, 0xD0, 0xFC));
    rect(100, 100, 100, 150);
    rect(mouseX, mouseY, 100, 150);
}

function initializeFields() {
}
