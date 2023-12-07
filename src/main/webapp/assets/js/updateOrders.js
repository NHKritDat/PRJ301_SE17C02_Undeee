/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function updateProductList(index) {
    var category = document.getElementById("category_" + index).value;
    var productSelect = document.getElementById("product_" + index);
    var sizeSelect = document.getElementById("size_" + index);
    // Gửi yêu cầu AJAX đến Servlet để lấy danh sách sản phẩm theo Category
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // Cập nhật danh sách sản phẩm trong select
            var response = JSON.parse(xhr.responseText);
            // Cập nhật danh sách sản phẩm
            updateSelectOptions1(productSelect, response.products);
            updateSelectOptions2(sizeSelect, response.sizes);
        }
    };
    xhr.open("POST", "update-orders", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.send("category=" + category);
}

function updateSelectOptions1(select, options) {
    // Xóa tất cả các options hiện tại
    select.innerHTML = "";
    // Thêm options mới từ danh sách sản phẩm
    for (var i = 0; i < options.length; i++) {
        var option = document.createElement("option");
        option.value = options[i].product_id;
        option.text = options[i].name;
        select.add(option);
    }
}


function updateSelectOptions2(select, options) {
    // Xóa tất cả các options hiện tại
    select.innerHTML = "";
    // Thêm options mới từ danh sách sản phẩm
    for (var i = 0; i < options.length; i++) {
        var option = document.createElement("option");
        option.value = options[i].size_id;
        option.text = options[i].name;
        select.add(option);
    }
}

// Trigger product and size loading for each category dropdown on page load
document.addEventListener("DOMContentLoaded", function () {
    var categoryDropdowns = document.querySelectorAll("[id^='category_']");
    categoryDropdowns.forEach(function (dropdown) {
//        console.log("Updating dropdown for:", dropdown.id);
        updateProductList(dropdown);
    });
});

