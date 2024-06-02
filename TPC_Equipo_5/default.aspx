<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="TPC_Equipo_5._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal">
        <%-- manual --%>
        <%--<div id="carouselManual" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img\91a192b77d77a80a4b7e9768877d.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="img\Notebook-Odyssey-2.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="img\main-qimg-b4fbad9cbb6d40505c8d2b2f1c4284f7-lq.jpeg" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselManual" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselManual" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>--%>
        <%-- manual --%>

        <%-- semiautomatico --%>
        <div id="carouselSemiautomatico" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img\91a192b77d77a80a4b7e9768877d.jpg" class="d-block w-100 h-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="img\main-qimg-b4fbad9cbb6d40505c8d2b2f1c4284f7-lq.jpeg" class="d-block w-100 h-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="img\Notebook-Odyssey-2.jpg" class="d-block w-100 h-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselSemiautomatico" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselSemiautomatico" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <%-- semiautomatico --%>

        <%-- automatico --%>
        <%--<div id="carouselAutomatico" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img\91a192b77d77a80a4b7e9768877d.jpg" class="d-block w-100 h-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="img\main-qimg-b4fbad9cbb6d40505c8d2b2f1c4284f7-lq.jpeg" class="d-block w-100 h-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="img\Notebook-Odyssey-2.jpg" class="d-block w-100 h-100" alt="...">
                </div>
            </div>
        </div>--%>
        <%-- automatico --%>

        <div>
            <h1>Productos que podrian interesarte</h1>
            <div class="row row-cols-1 row-cols-md-3 g-1 d-flex justify-content-center p-3">

                <div class="col d-flex justify-content-center">
                    <div class="card shadow p-3 mb-5 mt-5 bg-body-tertiary rounded" style="width: 18rem;">

                        <img src="img\91a192b77d77a80a4b7e9768877d.jpg" class="w-100 h-70 object-fit-cover" alt="..." onerror="this.src='https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'">
                        <div class="card-body">
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="text-decoration-none"> 
                <h5 class="card-title m-2 text-center fw-bolder">Titulo</h5>
                            </asp:LinkButton>
                            <h5 class="card-subtitle m-1 p-0 text-body-secondary text-end">$###,##</h5>
                        </div>
                    </div>
                </div>

                <div class="col d-flex justify-content-center">
                    <div class="card shadow p-3 mb-5 mt-5 bg-body-tertiary rounded " style="width: 18rem;">
                        <img src="img\images.jpeg" class="w-100 h-100 object-fit-cover " alt="..." onerror="this.src='https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'">
                        <div class="card-body">
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="text-decoration-none">
                  <h5 class="card-title m-2 text-center fw-bolder">Titulo</h5>
                            </asp:LinkButton>
                            <h5 class="card-subtitle m-1 p-0 text-body-secondary text-end">$###,##</h5>
                        </div>
                    </div>
                </div>

                <div class="col d-flex justify-content-center">
                    <div class="card shadow p-3 mb-5 mt-5 bg-body-tertiary rounded " style="width: 18rem;">
                        <img src="img\main-qimg-b4fbad9cbb6d40505c8d2b2f1c4284f7-lq.jpeg" class="w-100 h-100 object-fit-cover " alt="..." onerror="this.src='https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'">
                        <div class="card-body">
                            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="text-decoration-none">
                  <h5 class="card-title m-2 text-center fw-bolder">Titulo</h5>
                            </asp:LinkButton>
                            <h5 class="card-subtitle m-1 p-0 text-body-secondary text-end">$###,##</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
