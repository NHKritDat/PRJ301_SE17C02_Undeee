/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function showDetails(orderId) {
    document.getElementById('detailsForm_' + orderId).style.display = 'block';
}

function hideDetails(orderId) {
    document.getElementById('detailsForm_' + orderId).style.display = 'none';
}