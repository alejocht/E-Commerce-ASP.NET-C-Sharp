<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="TPC_Equipo_5._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal">
        <div id="carouselPublicitario" class="carousel slide">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselPublicitario" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselPublicitario" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselPublicitario" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#carouselPublicitario" data-bs-slide-to="3" aria-label="Slide 4"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://i.imgur.com/PSPDiah.jpeg" class="d-block w-100" alt="Imagen Publicitario 1">
                </div>
                <div class="carousel-item">
                    <img src="https://i.imgur.com/dZQLSHU.jpeg" class="d-block w-100" alt="Imagen Publicitario 2">
                </div>
                <div class="carousel-item">
                    <img src="https://i.imgur.com/oYcqOx6.jpeg" class="d-block w-100" alt="Imagen Publicitario 3">
                </div>
                <div class="carousel-item">
                    <img src="https://i.imgur.com/wxnSZ3u.jpeg" class="d-block w-100" alt="Imagen Publicitario 4.">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselPublicitario" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselPublicitario" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <br />
        <h1>Aca van productos aleatorios de la tienda (en carrusel)</h1>
        <br />
        <div id="carouselMarcas" class="carousel center-align" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" style="text-align: center">
                    <img src="https://www.qloud.ar/SITES/MARCAS/adata.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/amd.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/asrock.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/asus.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/corsair.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/epson.jpg" alt="...">
                </div>
                <div class="carousel-item" style="text-align: center">
                    <img src="https://www.qloud.ar/SITES/MARCAS/evga.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/gigabyte.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/hp.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/intel.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/jbl.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/lenovo.jpg" alt="...">
                </div>
                <div class="carousel-item" style="text-align: center">
                    <img src="https://www.qloud.ar/SITES/MARCAS/logitech.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/microsoft.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/motorola.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/msi.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/IMG/ryr-computacion-01-2021/206_03-07-2023-01-07-50-marcas_paraweb_razer-1.png" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/redragon.jpg" alt="...">
                </div>
                <div class="carousel-item" style="text-align: center">
                    <img src="https://www.qloud.ar/SITES/MARCAS/samsung.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/sandisk.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/sapphire.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/sony.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/toshiba.jpg" alt="...">
                    <img src="https://www.qloud.ar/SITES/MARCAS/western-digital.jpg" alt="...">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
