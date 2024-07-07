<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="TPC_Equipo_5._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal">
        <div id="carouselPublicitario" class="carousel slide">
            <div class="carousel-indicators">
                <asp:PlaceHolder ID="carouselIndicators" runat="server">
                    <asp:Literal ID="indicadorLiteral" runat="server" />
                </asp:PlaceHolder>
            </div>
            <div class="carousel-inner">
                <asp:PlaceHolder ID="carouselInner" runat="server">
                    <asp:Literal ID="itemLiteral" runat="server" />
                </asp:PlaceHolder>
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
        <div class="row row-cols-1 row-cols-md-3 g-1 d-flex justify-content-center p-3">
            <asp:Repeater ID="RepeaterProducto" runat="server">
                <ItemTemplate>
                    <div class="col d-flex justify-content-center">
                        <div class="card shadow p-3 mb-5 mt-5 bg-body-tertiary rounded" style="width: 18rem;">

                            <img src="<%#Eval("imagenPrincipal") %>" class="w-100 h-70 object-fit-cover" alt="..." onerror="this.src='https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'">
                            <div class="card-body" style="position: relative;">
                                <asp:LinkButton ID="LinkButton" runat="server" CssClass="text-decoration-none" CommandArgument='<%#Eval("ID") %>' CommandName="IDProducto" OnClick="LinkButton_Click"> 
                                    <h5 class="card-title m-2 text-center fw-bolder"><%#Eval("nombre") %></h5>
                                </asp:LinkButton>
                                <h5 class="card-subtitle m-1 p-0 text-body-secondary text-end" style="position: absolute; bottom: 0; right: 0; margin-bottom: 0.5rem;">$<%#Eval("precio") %></h5>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
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
