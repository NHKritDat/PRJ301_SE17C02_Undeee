/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function xoaSanPham(productId) {
    if (confirm("Bạn có chắc muốn xóa sản phẩm này?")) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "delete?id=" + productId, true);
        xhr.send();

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                location.reload();
            }
        };
    }
}

document.getElementById("searchButton").addEventListener("click", function () {
    var searchKeyword = document.getElementById("searchInput").value;
    var form = document.getElementById("searchForm");
    form.action = "view?searchKeyword=" + searchKeyword;
    form.submit();
});

document.getElementById('loaiSanPham').addEventListener('change', function () {
    const categoryId = document.getElementById('loaiSanPham').value;
    const searchForm = document.getElementById('searchForm');

    // Update the search form action URL to include the selected category ID
    searchForm.action = "view?searchCategory=" + categoryId;

    // Submit the search form to trigger the servlet processing
    searchForm.submit();
});

document.getElementById('status').addEventListener('change', function () {
    const status = document.getElementById('status').value;
    const searchForm = document.getElementById('searchForm');

    // Update the search form action URL to include the selected category ID
    searchForm.action = "view?searchKeyword=" + status;

    // Submit the search form to trigger the servlet processing
    searchForm.submit();
});