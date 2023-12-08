/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const imageElement = document.getElementById("clubs");
const imageSources = ["views/layout/Dong-gia-25k-slide-banner.png"
            , "views/layout/Series-ly-1-lit-slide-banner.png",
    "views/layout/Slide_banner-1.jpg"]; // Danh sách các đường dẫn ảnh

let currentImageIndex = 0;

function changeImage() {
    imageElement.src = imageSources[currentImageIndex];
    currentImageIndex = (currentImageIndex + 1) % imageSources.length;
}

setInterval(changeImage, 3000);

