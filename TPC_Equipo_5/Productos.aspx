<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="TPC_Equipo_5.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal">
        <%--Card de ejemplo--%>
        <div class="row row-cols-1 row-cols-md-3 g-1 d-flex justify-content-center p-3">
            <asp:Repeater ID="RepeaterProducto" runat="server">
                <ItemTemplate>
                    <div class="col d-flex justify-content-center">
                        <div class="card shadow p-3 mb-5 mt-5 bg-body-tertiary rounded" style="width: 18rem;">

                            <img src="img\91a192b77d77a80a4b7e9768877d.jpg" class="w-100 h-70 object-fit-cover" alt="..." onerror="this.src='https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'">
                            <div class="card-body">
                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="text-decoration-none"> 
                        <h5 class="card-title m-2 text-center fw-bolder"><%#Eval("nombre") %></h5>
                                </asp:LinkButton>
                                <h5 class="card-subtitle m-1 p-0 text-body-secondary text-end">$<%#Eval("precio") %></h5>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
