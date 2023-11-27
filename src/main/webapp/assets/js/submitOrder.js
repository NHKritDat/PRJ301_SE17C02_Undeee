/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function toggleAddressInput() {
    var diaChi = document.getElementById("diaChi");
    var diaChiKhacDiv = document.getElementById("diaChiKhacDiv");
    var diaChiKhacInput = document.getElementById("diaChiKhac");
    
    if (diaChi.value === "other") {
        diaChiKhacDiv.style.display = "block";
        diaChiKhacInput.disabled = false;
    } else {
        diaChiKhacDiv.style.display = "none";
        diaChiKhacInput.disabled = true;
    }
}

function validateForm() {
    var diaChi = document.getElementById("diaChi");
    if (diaChi.value === "default") {
        alert("Vui lòng chọn địa chỉ!");
        return false;
    }
    return true;
}