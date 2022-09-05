
function setup() {
    initializeFields();
    // 只執行1次
    // 開個500x500窗
    createCanvas(500, 500);
    // 先背景
    background(color(0xFF, 0xFF, 0xF2));
    // 筆觸紅色
    stroke(255, 0, 0);
}

function draw() {
    // 每秒60次
    if (mouseIsPressed) {
        line(mouseX, mouseY, pmouseX, pmouseY);
    }
}

function keyPressed() {
    // 如果有按下按鍵
    if (key == '1')
        stroke(color(0xFA, 0x08, 0x34));
    if (key == '2')
        stroke(color(0xFA, 0xCA, 0x08));
    if (key == '3')
        stroke(color(0xFA, 0xF2, 0x08));
    if (key == '4')
        stroke(color(0x08, 0xFA, 0x66));
    if (key == '5')
        stroke(color(0x08, 0x29, 0xFA));
// 你自己加
}

function initializeFields() {
}
