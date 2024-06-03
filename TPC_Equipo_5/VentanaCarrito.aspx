<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="VentanaCarrito.aspx.cs" Inherits="TPC_Equipo_5.VentanaCarrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >  
    
    <div class="container" id="containerPrincipal" style="height: 800px;">
        <div class="row">
            <%--<asp:Repeater runat="server" ID="repCarrito">
                <ItemTemplate>--%> 
                    <div>
                        <div class="container border border-danger" style="background-color: whitesmoke; height: 125px; width:1000px;" >
                            <div class="row ">
                                <div class="col-4">
                                    <img src="https://innovatech.ar/wp-content/uploads/2021/08/11-2.jpg"style="width: 100px; height: 100px" class="card-img-top" alt="Image description" onerror="this.src='https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'">
                                </div>
                                <div class="col text-start p-md-5">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                <div>
                                                    <label style="">Nombre  </label>                                               
                                                    <label>Precio: $100000 </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container">
                                        <div class="row">                                           
                                            <div class="text-end">
                                                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" CommandArgument='' CommandName="IdArticulo" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                <%--</ItemTemplate>
            </asp:Repeater>--%>
        </div>
        <br />
        <div class="text-start">
            <div class="container" id="containerResumenCompra">
                <div class="row">
                    <div class="col">
                        <h4>Resumen del pedido</h4>
                        <div>
                            <asp:Label ID="lblSubTotal" runat="server" Text="Subtotal: xxxx" CssClass="p" />
                        </div>
                        <div>
                            <asp:Label ID="lblEnvio" runat="server" Text="Envio: xxxx" CssClass="p" />
                        </div>
                        <div>
                            <asp:Label ID="lblTotalCompra" runat="server" Text="Total: $xxxx" CssClass="h4" />
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <button type="button" class="btn  w-75" data-bs-toggle="modal" data-bs-target="#btnAvisoCompra " style="background-color: black; color:white;">
                            Comprar
                        </button>
                    </div>
                    <div class="col">
                        <asp:Button ID="btnContinuarComprando" runat="server" Text="Continuar comprando" CssClass="btn  w-75" OnClick="btnContinuarComprando_Click" style="background-color: #c02a2a ; color:white;" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <%--<div class="container" id="containerCarritoVacio" style="height: 500px">
        <div class="row">
            <div class="col">
                <h3>Lista de productos</h3>
                <p>No hay productos en el carrito de momento, no te quedes con las ganas!</p>
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="container text-end">
                                <div class="row">
                                    <div class="col">
                                        <asp:Button ID="Button2" runat="server" Text="Continuar comprando" CssClass="btn btn-primary" OnClick="Button2_Click" style="background-color: #c02a2a ;" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  
    </div>--%>
</div>
</asp:Content>
