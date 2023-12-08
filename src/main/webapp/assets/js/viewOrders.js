/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function changeSearchBy() {
    var searchBy = document.getElementById("searchBy").value;
    var searchInput = document.getElementById("searchInput");
    var statusSelect = document.getElementById("statusSelect");

    searchInput.name = "";
    statusSelect.name = "";

    if (searchBy === "status") {
        searchInput.style.display = "none";
        statusSelect.style.display = "block";
        statusSelect.name = "search";
    } else if (searchBy === "customerName") {
        searchInput.style.display = "block";
        statusSelect.style.display = "none";
        searchInput.type = "text";
        searchInput.placeholder = "Search customer name";
        searchInput.name = "search";
    } else {
        searchInput.style.display = "block";
        statusSelect.style.display = "none";
        searchInput.type = "date";
        searchInput.name = "search";
    }
}

