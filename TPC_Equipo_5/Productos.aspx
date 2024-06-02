<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="TPC_Equipo_5._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal">
        <%--Card de ejemplo--%>

        <div class="card shadow p-3 mb-5 bg-body-tertiary rounded " style="width: 18rem;">
            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="text-decoration-none">
                  <img src="img\91a192b77d77a80a4b7e9768877d.jpg" class="card-img-top" alt="..." >
                  <div class="card-body">
                      <h5 class="card-title m-2 text-center fw-bolder">Titulo</h5>
                      <h5 class="card-subtitle m-1 p-0 text-body-secondary text-end">$###,##</h5>
                  </div>
            </asp:LinkButton>
        </div>

        <%--Repeater de Cards--%>
        <%--<asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="text-decoration-none">
                   <div class="card shadow p-3 mb-5 bg-body-tertiary rounded " style="width: 18rem;">
                      <img src="img\91a192b77d77a80a4b7e9768877d.jpg" class="card-img-top" alt="..." >
                      <div class="card-body">
                          <h5 class="card-title m-2 text-center fw-bolder">Titulo</h5>
                          <h5 class="card-subtitle m-1 p-0 text-body-secondary text-end">$###,##</h5>
                       </div>
                    </div>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>--%>
    </div>
</asp:Content>
