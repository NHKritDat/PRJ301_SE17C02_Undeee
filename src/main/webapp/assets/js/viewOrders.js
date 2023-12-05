/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function changeSearchBy() {
    var searchBy = document.getElementById("searchBy").value;
    var searchInput = document.getElementById("searchInput");

    if (searchBy === "status") {
        searchInput.type = "text";
        searchInput.placeholder = "Search order status";
    } else if (searchBy === "customerName") {
        searchInput.type = "text";
        searchInput.placeholder = "Search customer name";
    } else {
        searchInput.type = "date";
    }
}