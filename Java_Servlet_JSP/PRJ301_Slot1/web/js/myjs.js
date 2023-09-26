/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
var flag = true, canMove = true;
function myfun(x, y, n){
    var obj = document.getElementById("btn" + (x*n + y));
    if(obj.innerHTML === "" && canMove){
        obj.classList.add(flag?"red":"blue");
        obj.innerHTML = flag? "X":"O";
        canMove = !checkWin(x, y, n);
        flag = !flag;
    }
}

function check(x, n){
    return x >= 0 && x < n;
}

function checkWin(x, y, n){
    c = flag ? "X":"O";
    var count = [0, 0, 0, 0];
    for(var i=-4; i<5; i++){
        if(check(x+i, n)&&check(y+i, n)){
            if(document.getElementById("btn" + ((x+i)*n + y+i)).innerHTML == c)
                count[0]++;
            else count[0] = 0;
            if(count[0] == 5) return true;
        }
        if(check(x, n)&&check(y+i, n)) {
            if(document.getElementById("btn" + (x*n + y+i)).innerHTML == c)
                count[1]++;
            else count[1] = 0;
            if(count[1] == 5) return true;
        }
        if(check(x-i, n)&&check(y+i, n)) {
            if(document.getElementById("btn" + ((x-i)*n + y+i)).innerHTML == c)
                count[2]++;
            else count[2] = 0;
            if(count[2] == 5) return true;
        }
        if(check(x+i, n)&&check(y, n)) {
            if(document.getElementById("btn" + ((x+i)*n + y)).innerHTML == c)
                count[3]++;
            else count[3] = 0;
            if(count[3] == 5) return true;
        }
        console.log(count[0]+", "+count[1] + ", " + count[2] + ", " + count[3]);
    }
    return false;
}